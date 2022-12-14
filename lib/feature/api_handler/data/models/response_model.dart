import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';

class ResponseModel {
  int statusCode;
  ResultEnum result;
  List<dynamic>? message;
  dynamic data;

  ResponseModel({
    this.statusCode = 555,
    this.result = ResultEnum.ERROR,
    this.message,
    this.data,
  });

  ResponseModel fromJson(dynamic json){
    statusCode = json["status_code"];
    data = json["data"];
    // result = json["result"];
    message = json["messages"] ?? [];
    result = ResultEnum.values.byName(json["result"] ?? "ERROR");
    // String val = json['result'];
    // return CounterState(
    //   value: map['value'],
    //   colorNumber: ColorNumber.values[val],
    // );
    // Result f = Result.values.firstWhere((e) => e.toString() == "Result." + "SUCCESS");


    return this;
  }
}
