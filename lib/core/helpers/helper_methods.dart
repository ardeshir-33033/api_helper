import 'dart:convert';

import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';
import 'package:dio/dio.dart';

import '../../feature/api_handler/data/enums/header_enum.dart';
import '../../feature/api_handler/data/enums/response_enum.dart';
import '../../feature/api_handler/data/models/query_model.dart';
import '../../feature/api_handler/data/models/response_model.dart';
import '../consts/api_consts.dart';
import '../errors/failure.dart';

abstract class ApiHelperMethods {
  Map<String, String>? headerGetter(HeaderEnum typeEnum);

  String generateQuery(List<QueryModel> queries);

  String urlGenerator(String url, List<QueryModel> query, String? pathVariable);
}

class ApiHelperMethodsImpl implements ApiHelperMethods {
  @override
  Map<String, String>? headerGetter(HeaderEnum typeEnum) {
    switch (typeEnum) {
      case HeaderEnum.imageHeaderEnum:
        return ApiConstants().imageHeader;
      case HeaderEnum.bearerHeaderEnum:
        return ApiConstants().bearerHeader;
      case HeaderEnum.formDataHeaderEnum:
        return ApiConstants().formDataHeader;
      case HeaderEnum.basicHeaderEnum:
        return ApiConstants().basicHeader;
      case HeaderEnum.emptyHeaderEnum:
        return null;
      default:
        return ApiConstants().basicHeader;
    }
  }

  @override
  String generateQuery(List<QueryModel> queries) {
    String query = "";
    if (queries.isNotEmpty) {
      query += "?";
      for (var element in queries) {
        if (element.value != "null") {
          String? nm = element.name;
          String? vl = element.value;

          query += "$nm=$vl&";
        }
      }
    }

    return query;
  }

  @override
  String urlGenerator(
      String url, List<QueryModel>? query, String? pathVariable) {
    if (pathVariable != null) url += "/$pathVariable";
    if (query != null) url += generateQuery(query);

    return url;
  }

  responseGetter<T>(ResponseEnum typeEnum, Response response) {
    if (response.statusCode != 200) {
      ApiFailure(ResponseModel(statusCode: response.statusCode ?? 555),
          response.realUri.path);
    }
    try {
      switch (typeEnum) {
        case ResponseEnum.responseModelEnum:
          String data = utf8.decode(response.data.bodyBytes);
          ResponseModel result = ResponseModel().fromJson(
            json.decode(data),
          );
          if (result.statusCode != 200) {
            ApiFailure(
                ResponseModel(
                  statusCode: result.statusCode,
                  result: ResultEnum.error,
                  data: result.data,
                  message: result.message,
                ),
                response.realUri.path);
          }
          return result;
        default:
          return response.data.bodyBytes;
      }
    } catch (e) {
      ApiFailure(
          ResponseModel(
              statusCode: response.statusCode ?? 555,
              message: [e.toString()]),
          response.realUri.path);

      return ResponseModel(
          result: ResultEnum.error,
          statusCode: response.statusCode ?? 555,
          data: null,
          message: [""]);
    }
  }
}
