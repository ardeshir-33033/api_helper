import 'dart:convert';

import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

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
  String generateQuery(List<QueryModel> params) {
    return params.map((q) => '${q.name}=${q.value}').join('&');
  }

  @override
  String urlGenerator(
      String url, List<QueryModel>? query, String? pathVariable) {
    if (pathVariable != null) url += "/$pathVariable";
    if (query != null && query.isNotEmpty) {
      url += '?${generateQuery(query)}';
    }

    return url;
  }

  Response responseGetter(ResponseEnum typeEnum, Response response) {
    if (response.statusCode != 200 && response.statusCode != 201) {
      return response;
      // ApiFailure(ResponseModel(statusCode: response.statusCode ?? 555),
      //     response.realUri.path);
    }
    try {
      switch (typeEnum) {
        case ResponseEnum.responseModelEnum:
          // String data = utf8.decode(response.data.bodyBytes);
          // ResponseModel result = ResponseModel().fromJson(
          // json.decode(response.data),
          // response.data,
          // );
          return response;
        case ResponseEnum.unit8ListEnum:
          final data = response.data;
          if (data is Uint8List) return response;
          if (data is List<int>) {
            response.data = Uint8List.fromList(data);
            return response;
          }
          if (data is List) {
            response.data = Uint8List.fromList(data.cast<int>());
            return response;
          }
          response.data = Uint8List(0);
          return response;
        // if (result.statusCode != 200 && response.statusCode != 201) {
        //   ApiFailure(
        //       ResponseModel(
        //         statusCode: response.statusCode,
        //         result: ResultEnum.error,
        //         data: result.data,
        //         message: result.message,
        //       ),
        //       response.realUri.path);
        // }
        // return result;
        default:
          return response.data.bodyBytes;
      }
    } catch (e) {
      return response;
      // ApiFailure(
      //     ResponseModel(
      //         statusCode: response.statusCode ?? 555, message: e.toString()),
      //     response.realUri.path);
      //
      // return ResponseModel(
      //     result: ResultEnum.error,
      //     statusCode: response.statusCode ?? 555,
      //     data: null,
      //     message: "");
    }
  }
}
