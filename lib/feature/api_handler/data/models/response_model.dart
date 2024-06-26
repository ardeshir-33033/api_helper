import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';

class ResponseModel {
  int? statusCode;
  ResultEnum result;
  String? message;
  dynamic data;

  ResponseModel({
    this.statusCode,
    this.result = ResultEnum.error,
    this.message,
    this.data,
  });

  ResponseModel fromJson(dynamic json) {
    data = json["data"];
    // result = json["result"];
    message = json["messages"] ?? "";
    result = ResultEnum.values.byName(json["status"] ?? "error");
    // String val = json['result'];
    // return CounterState(
    //   value: map['value'],
    //   colorNumber: ColorNumber.values[val],
    // );
    // Result f = Result.values.firstWhere((e) => e.toString() == "Result." + "SUCCESS");

    return this;
  }
}
