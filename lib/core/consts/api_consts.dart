import 'package:api_handler/core/consts/user_agent.dart';

import '../token/token.dart';
import 'dart:io';

class ApiConstants {
  Map<String, String> imageHeader = {
    HttpHeaders.authorizationHeader: " ${Token().token ?? ""}",
    "User-Agent": UserAgent().userAgent ?? '',
    // "Accept": "multipart/byteranges",
    // "content-type": "image/jpeg; charset=utf-8",
  };

  Map<String, String> bearerHeader = {
    HttpHeaders.authorizationHeader: " ${Token().token ?? ""}",
    "User-Agent": UserAgent().userAgent ?? '',
    // "Accept": "application/json",
    // "content-type": "application/json; charset=utf-8",
  };

  Map<String, String> formDataHeader = {
    "User-Agent": UserAgent().userAgent ?? '',
    // "Accept": "multipart/form-data",
    // "content-type": "application/json; charset=utf-8",
  };

  Map<String, String> basicHeader = {
    "User-Agent": UserAgent().userAgent ?? '',
    // "Accept": "application/json",
    // "content-type": "application/json; charset=utf-8",
  };
}
