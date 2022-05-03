import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseurl = 'https://jsonplaceholder.typicode.com';

  Future<String> get({required String endpoint}) async {
    print('getメソッドスタート！');
    return _safeApiCall(() async => http.get(Uri.parse('$baseurl$endpoint')));
  }

  Future<String> post({
    required String endpoint,
    required String body,
  }) async {
    print('postメソッドスタート！');
    return _safeApiCall(
      () async => http.post(
        Uri.parse('$baseurl$endpoint'),
        body: body,
      ),
    );
  }

  //PUT: 完全上書き
  Future<String> put({
    required String endpoint,
    required String body,
  }) async {
    print('putメソッドスタート！');
    return _safeApiCall(
      () async => http.put(
        Uri.parse('$baseurl$endpoint'),
        body: body,
      ),
    );
  }

  //PATCH: 部分的な上書き(指定した箇所のみ上書き)
  Future<String> patch({
    required String endpoint,
    required String body,
  }) async {
    print('patchメソッドスタート！');
    return _safeApiCall(
      () async => http.patch(
        Uri.parse('$baseurl$endpoint'),
        body: body,
      ),
    );
  }

  Future<String> delete({required String endpoint}) async {
    print('deleteメソッドスタート！');
    return _safeApiCall(
      () async => http.delete(
        Uri.parse('$baseurl$endpoint'),
      ),
    );
  }

  Future<String> _safeApiCall(Function callback) async {
    print('_safeApiCallメソッドスタート！');
    final response = await callback() as http.Response;
    return _parseResponse(
      statusCode: response.statusCode,
      responseBody: response.body,
    );
  }

  Future<String> _parseResponse({
    required int statusCode,
    required String responseBody,
  }) async {
    print('_parseResponseメソッドスタート！');
    switch (statusCode) {
      case 200:
      case 201:
        return responseBody;
      case 400:
        throw Exception('400 Bad Request');
      case 401:
        throw Exception('401 Unauthorized');
      case 403:
        throw Exception('400 Forbidden');
      case 404:
        throw Exception('404 Not Found');
      case 405:
        throw Exception('405 Method Not Allowed');
      case 500:
        throw Exception('500 Internal Server Error');
      default:
        throw Exception('Http status $statusCode unknown error');
    }
  }
}
