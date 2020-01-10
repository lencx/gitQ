// @author: lencx
// @create_at: Jan 10, 2020
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';

import 'package:gitq/config.dart';

class HubNet {
  static BaseOptions baseOption = BaseOptions(
    baseUrl: Config.NET_GITHUB_API,
    connectTimeout: 30000,
    receiveTimeout: 20000,
    headers: {
      'Accept': Config.NET_API_VERSION,
      'Content-Type': Config.NET_CONTENT_TYPE,
    },
  );

  Dio _dio = new Dio(baseOption);
  Dio get dio => _dio;

  static final HubNet _hubNet = HubNet._internal();

  HubNet._internal() {
    // debug or profile mode: set proxy
    // if (!Config.isRelease) {
    //   setProxy(Config.PROXY);
    // }

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (Options _options) async {
        if (!_options.headers.containsKey('Authorization') || (_options.headers['Authorization'] as String).isEmpty) {
          // TODO: get authorization
          String basic = '';
          _options.headers['Authorization'] = basic;
        }
        return _options;
      }
      // TODO: logger
    ));
  }

  factory HubNet() {
    return _hubNet;
  }

  void setProxy(String address) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.findProxy = (url) {
        return 'PROXY $address';
      };
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
  }
}

HubNet hubNet = HubNet();