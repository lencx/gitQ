// @author: lencx
// @create_at: Jan 06, 2020
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Net extends http.BaseClient {
  final Map<String, String> defaultHeaders;
  final String baseURL;
  http.Client _httpClient = new http.Client();
  Encoding _encoding = Encoding.getByName("utf-8");

  Net({this.defaultHeaders = const {}, this.baseURL = ''});

  // String getURL(String url) {
  //   if (baseURL != null) {
  //     return '$baseURL$url';
  //   }
  //   return url;
  // }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers.addAll(defaultHeaders);
    return _httpClient.send(request);
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    headers.addAll(defaultHeaders);
    return _httpClient.get(
      '$baseURL$url',
      headers: headers,
    );
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    headers.addAll(defaultHeaders);
    return _httpClient.post(
      '$baseURL$url',
      body: body, headers: headers, encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    headers.addAll(defaultHeaders);
    return _httpClient.patch(
      '$baseURL$url',
      body: body, headers: headers, encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    headers.addAll(defaultHeaders);
    return _httpClient.put(
      '$baseURL$url',
      headers: headers, body: body, encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    headers.addAll(defaultHeaders);
    return _httpClient.head(
      '$baseURL$url',
      headers: headers,
    );
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    headers.addAll(defaultHeaders);
    return _httpClient.delete(
      '$baseURL$url',
      headers: headers,
    );
  }
}
