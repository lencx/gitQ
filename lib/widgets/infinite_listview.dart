/***
 * @author: lencx
 * @create_at: Jan 05, 2020
 **/
import 'package:flutter/material.dart';

class InfiniteListview extends StatefulWidget {
  @override
  _InfiniteListviewState createState() => _InfiniteListviewState();
}

class _InfiniteListviewState extends State<InfiniteListview> {
  List<int> items = List.generate(20, (i) => i);
  ScrollController _scrollController = ScrollController();
  bool _isPerformingRequest = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // dynamic data loading
  Future<List<int>> fakeRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  _loadMoreData() async {
    if (!_isPerformingRequest) {
      setState(() => _isPerformingRequest = true);
      var list;
      if (items.length < 50) {
        list = items.length + 10;
      }
      try {
        List<int> _newEntries = await fakeRequest(items.length, list);
        if (_newEntries.isEmpty) {
          double _edge = 50.0;
          double _offsetFromBottom = _scrollController.position.maxScrollExtent - _scrollController.position.pixels;
          if (_offsetFromBottom < _edge) {
            _scrollController.animateTo(
              _scrollController.offset - (_edge - _offsetFromBottom),
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        }
        setState(() {
          items.addAll(_newEntries);
          _isPerformingRequest = false;
        });
      } catch (e) {
        setState(() {
          _isPerformingRequest = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1,
        itemBuilder: (context, idx) {
          if (idx == items.length) {
            return _buildProgressIndicator(_isPerformingRequest);
          } else {
            return ListTile(
              title: Text('$idx'),
            );
          }
        },
      )
    );
  }
}

Widget _buildProgressIndicator(bool isPerformed) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Opacity(
        opacity: isPerformed ? 1.0 : 0,
        child: CircularProgressIndicator(),
      ),
    ),
  );
}