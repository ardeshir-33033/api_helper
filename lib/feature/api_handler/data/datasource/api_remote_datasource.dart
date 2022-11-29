import 'package:api_handler/core/errors/failure.dart';
import 'package:api_handler/core/helpers/helper_methods.dart';
import 'package:api_handler/feature/api_handler/data/enums/header_enum.dart';
import 'package:api_handler/feature/api_handler/data/enums/result_enums.dart';
import 'package:api_handler/feature/api_handler/data/models/response_model.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/network_info.dart';
import '../enums/response_enum.dart';
import '../models/query_model.dart';

abstract class ApiRemoteDataSource {
  static int _tries = 1;
  static int _timeout = 20;

  Future<ResponseModel> httpGet(
    String url,
    List<QueryModel> query,
    String? pathVariable,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
  );

  Future<ResponseModel> httpPost(
    String url,
    List<QueryModel> query,
    String? pathVariable,
    var body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
  );

  Future<ResponseModel> httpPut(
    String url,
    List<QueryModel> query,
    String? pathVariable,
    var body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
  );

  Future<ResponseModel> httpDelete(
    String url,
    List<QueryModel> query,
    String? pathVariable,
    var body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
  );
}

class ApiRemoteDataSourceImpl extends ApiRemoteDataSource {
  @override
  Future<ResponseModel> httpDelete(
      String url,
      List<QueryModel>? query,
      String? pathVariable,
      body,
      HeaderEnum headerEnum,
      ResponseEnum responseEnum) async {
    int i = 0;
    ResponseModel responseModel = ResponseModel();
    while (i < ApiRemoteDataSource._tries) {
      try {
        var response = await Dio()
            .delete(
                ApiHelperMethodsImpl().urlGenerator(url, query, pathVariable),
                data: body,
                options: Options(
                  headers: ApiHelperMethodsImpl().headerGetter(headerEnum),
                ))
            .timeout(Duration(seconds: ApiRemoteDataSource._timeout));
        responseModel =
            ApiHelperMethodsImpl().responseGetter(responseEnum, response);
      } catch (e) {
        ApiFailure(ResponseModel(message: [e.toString()]), url);

        NetworkInfoImpl networkInfo = NetworkInfoImpl();
        await networkInfo.isConnected.then((value) {
          if (value) {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          } else {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          }
        });
      }
      if (responseModel.result == ResultEnum.SUCCESS) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> httpGet(String url, List<QueryModel>? query,
      String? pathVariable, HeaderEnum headerEnum, ResponseEnum responseEnum) async {
    int i = 0;
    ResponseModel responseModel = ResponseModel();
    while (i < ApiRemoteDataSource._tries) {
      try {
        var response = await Dio()
            .get(
            ApiHelperMethodsImpl().urlGenerator(url, query, pathVariable),
            options: Options(
              headers: ApiHelperMethodsImpl().headerGetter(headerEnum),
            ))
            .timeout(Duration(seconds: ApiRemoteDataSource._timeout));
        responseModel =
            ApiHelperMethodsImpl().responseGetter(responseEnum, response);
      } catch (e) {
        ApiFailure(ResponseModel(message: [e.toString()]), url);

        NetworkInfoImpl networkInfo = NetworkInfoImpl();
        await networkInfo.isConnected.then((value) {
          if (value) {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          } else {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          }
        });
      }
      if (responseModel.result == ResultEnum.SUCCESS) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> httpPost(
      String url,
      List<QueryModel>? query,
      String? pathVariable,
      body,
      HeaderEnum headerEnum,
      ResponseEnum responseEnum) async {
    int i = 0;
    ResponseModel responseModel = ResponseModel();
    while (i < ApiRemoteDataSource._tries) {
      try {
        var response = await Dio()
            .post(
            ApiHelperMethodsImpl().urlGenerator(url, query, pathVariable),
            data: body,
            options: Options(
              headers: ApiHelperMethodsImpl().headerGetter(headerEnum),
            ))
            .timeout(Duration(seconds: ApiRemoteDataSource._timeout));
        responseModel =
            ApiHelperMethodsImpl().responseGetter(responseEnum, response);
      } catch (e) {
        ApiFailure(ResponseModel(message: [e.toString()]), url);

        NetworkInfoImpl networkInfo = NetworkInfoImpl();
        await networkInfo.isConnected.then((value) {
          if (value) {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 510,
                data: null,
                message: ["Error Occurred"]);
          } else {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 555,
                data: null,
                message: ["No Internet Connection"]);
          }
        });
      }
      if (responseModel.result == ResultEnum.SUCCESS) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }

  @override
  Future<ResponseModel> httpPut(
      String url,
      List<QueryModel>? query,
      String? pathVariable,
      body,
      HeaderEnum headerEnum,
      ResponseEnum responseEnum) async {
    int i = 0;
    ResponseModel responseModel = ResponseModel();
    while (i < ApiRemoteDataSource._tries) {
      try {
        var response = await Dio()
            .put(
            ApiHelperMethodsImpl().urlGenerator(url, query, pathVariable),
            data: body,
            options: Options(
              headers: ApiHelperMethodsImpl().headerGetter(headerEnum),
            ))
            .timeout(Duration(seconds: ApiRemoteDataSource._timeout));
        responseModel =
            ApiHelperMethodsImpl().responseGetter(responseEnum, response);
      } catch (e) {
        ApiFailure(ResponseModel(message: [e.toString()]), url);

        NetworkInfoImpl networkInfo = NetworkInfoImpl();
        await networkInfo.isConnected.then((value) {
          if (value) {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          } else {
            responseModel = ResponseModel(
                result: ResultEnum.ERROR,
                statusCode: 545,
                data: null,
                message: [""]);
          }
        });
      }
      if (responseModel.result == ResultEnum.SUCCESS) {
        return responseModel;
      }
      i++;
    }
    return responseModel;
  }
}
