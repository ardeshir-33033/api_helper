import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';

class ResponseModel {
  int statusCode;
  ResultEnum result;
  List<String> message;
  dynamic data;

  ResponseModel({
    this.statusCode = 555,
    this.result = ResultEnum.error,
    this.message = const [],
    this.data,
  });

  ResponseModel fromJson(dynamic json){
    statusCode = json["status_code"];
    data = json["data"];
    result = json["result"];
    message = json["message"];

    return this;
  }
}
