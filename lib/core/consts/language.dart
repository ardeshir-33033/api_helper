class Language {
  static String? _language;


  set setAgent(String language){
    _language = language;
  }

  String? get language => _language;
}
