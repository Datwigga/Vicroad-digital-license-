class ApiClient {
  static const String _baseUrl = 'https://api.vicroads-digital.gov.au';

  Future<dynamic> get(String endpoint) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      return _handleMockResponse(endpoint);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> post(String endpoint, dynamic body) async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      return _handleMockResponse(endpoint, body: body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  dynamic _handleMockResponse(String endpoint, {dynamic body}) {
    if (endpoint.contains('/licenses')) {
      return {'status': 'success', 'data': {'licenses': []}};
    }
    if (endpoint.contains('/vehicles')) {
      return {'status': 'success', 'data': {'vehicles': []}};
    }
    return {'status': 'success', 'data': {}};
  }
}