import 'package:flutter/material.dart';
import '../../feature/api_handler/data/models/response_model.dart';

abstract class Failure<ResponseModel, String> {
  // call(ResponseModel response, String path);

  printError(String text) {
    // print('\x1B[33m$text\x1B[0m');

    debugPrint('\x1B[33m$text\x1B[0m');
  }
}

// General failures
class ApiFailure extends Failure<ResponseModel, String> {
  // @override
  ApiFailure(response, path) {
    printError('Url: $path');
    printError('StatusCode: ${response.statusCode}');
    printError('IsStatus: ${response.isSuccess}');
    printError('Data: ${response.data.toString()}');
    printError('Message: ${response.message}');
  }
}
