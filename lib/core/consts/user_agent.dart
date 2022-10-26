class UserAgent {
  static String? _userAgent;


  set setAgent(String userAgent){
    _userAgent = userAgent;
  }

  String? get userAgent => _userAgent;
}
