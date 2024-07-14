import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';
import 'package:api_handler/feature/api_handler/data/models/links_model.dart';

class ResponseModel {
  String? message;
  dynamic data;
  int? count;
  int? totalPages;
  LinksModel? links;
  ResultEnum? result;
  int? statusCode;

  ResponseModel({
    this.count,
    this.message,
    this.data,
    this.totalPages,
    this.links,
    this.result,
    this.statusCode,
  });

  ResponseModel fromJson(dynamic json) {
    data = json['data'];
    message = json['messages'] ?? "";
    links = links != null ? LinksModel().fromJson(json['links']) : null;
    count = json['count'];
    totalPages = json['totalPages'];
    return this;
  }
}
