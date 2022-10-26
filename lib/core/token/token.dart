class Token {
  static String? _token;

  set setToken(String? token) {
    _token = token;
  }

  String? get token {
    return _token;
  }
}
