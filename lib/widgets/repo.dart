/***
 * @author: lencx
 * @create_at: Jan 05, 2020
 **/
import 'package:flutter/material.dart';
import 'package:gitq/models/repo.dart';
// import 'package:infinite_listview/infinite_listview.dart';

Widget repoCard(Repo repo) {
  return Card(
    child: Column(
      children: <Widget>[
        Text('name: ${repo.name}'),
        Text('language: ${repo.language}'),
        Text('forks_count: ${repo.forksCount}'),
        Text('description: ${repo.description}'),
        Text('stargazers_count: ${repo.stargazersCount}'),
        Text('size: ${repo.size}'),
        Text('tags_url: ${repo.tagsUrl}'),
      ]
    ),
  );
}


// Widget reposList() {
//   return InfiniteListView.separated(
//     itemBuilder: (BuildContext context, int index) {
//         return Material(
//           child: InkWell(
//             onTap: () {},
//             child: ListTile(
//               subtitle: Text('Subtitle $index'),
//               trailing: const Icon(Icons.chevron_right),
//             ),
//           ),
//         );
//       },
//     separatorBuilder: (BuildContext context, int index) => const Divider(height: 2.0),
//   );
// }