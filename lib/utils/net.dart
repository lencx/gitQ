// @author: lencx
// @create_at: Jan 06, 2020
import 'dart:convert';
import 'package:http/http.dart';
export 'package:http/http.dart';

/// Override http
///
/// Can set the [defaultHeaders] and [baseURL]
/// Added [mergeHead], [setHead] and [getHead] private method
class Net extends BaseClient {
  final Map<String, String> defaultHeaders;
  final String baseURL;
  Client _httpClient = new Client();
  Map<String, String> mergeHeaders = {};
  Encoding _encoding = Encoding.getByName("utf-8");

  Net({this.defaultHeaders = const {}, this.baseURL = ''});

  /// Merge request headers
  void mergeHead(Map<String, String> headers) {
    mergeHeaders = {
      ...mergeHeaders,
      ...headers,
    };
  }

  /// Set request headers
  void setHead(Map<String, String> headers) {
    getHead(headers, isSet: true);
  }

  /// Get request headers
  Map<String, String> getHead(Map<String, String> headers, {bool isSet = false}) {
    if (headers != null) {
      headers = isSet
        ? headers
        : {
          ...defaultHeaders,
          ...mergeHeaders,
          ...headers,
        };
    } else {
      headers = {};
    }
    return headers;
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    request.headers.addAll(defaultHeaders);
    return _httpClient.send(request);
  }

  @override
  Future<Response> get(url, {Map<String, String> headers}) {
    return _httpClient.get('$baseURL$url', headers: getHead(headers));
  }

  @override
  Future<Response> post(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient.post(
      '$baseURL$url',
      body: body, headers: getHead(headers), encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> patch(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient.patch(
      '$baseURL$url',
      body: body, headers: getHead(headers), encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> put(url, {Map<String, String> headers, body, Encoding encoding}) {
    return _httpClient.put(
      '$baseURL$url',
      headers: getHead(headers), body: body, encoding: encoding ??_encoding,
    );
  }

  @override
  Future<Response> head(url, {Map<String, String> headers}) {
    return _httpClient.head('$baseURL$url', headers: getHead(headers));
  }

  @override
  Future<Response> delete(url, {Map<String, String> headers}) {
    return _httpClient.delete('$baseURL$url', headers: getHead(headers));
  }
}
