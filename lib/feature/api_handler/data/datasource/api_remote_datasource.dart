import 'package:api_handler/core/helpers/helper_methods.dart';
import 'package:api_handler/core/network/network_info.dart';
import 'package:api_handler/feature/api_handler/data/enums/header_enum.dart';
import 'package:dio/dio.dart';

import '../enums/response_enum.dart';
import '../models/query_model.dart';

abstract class ApiRemoteDataSource {
  static int _tries = 1;
  static int _timeout = 40;

  Future<Response> httpGet(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  );

  Future<Response> httpPost(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  );

  Future<Response> httpPut(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  );

  Future<Response> httpPatch(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  );

  Future<Response> httpDelete(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  );
}

class ApiRemoteDataSourceImpl extends ApiRemoteDataSource {
  ApiRemoteDataSourceImpl({NetworkInfo? networkInfo})
      : _networkInfo = networkInfo ?? NetworkInfoImpl();

  final NetworkInfo _networkInfo;
  final ApiHelperMethodsImpl _helperMethods = ApiHelperMethodsImpl();

  Future<void> _ensureConnection() async {
    final connected = await _networkInfo.isConnected;
    if (!connected) {
      throw Exception(NetworkInfoImpl.noInternetMessage);
    }
  }

  Future<Response> _performRequest(
    Future<Response> Function() request,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}
  ) async {
    int i = 0;
    Response? responseModel;
    final timeout = timeoutSeconds ?? ApiRemoteDataSource._timeout;

    while (i < ApiRemoteDataSource._tries) {
      try {
        await _ensureConnection();
        final response = await request()
            .timeout(Duration(seconds: timeout));
        responseModel = _helperMethods.responseGetter(responseEnum, response);
      } on DioException catch (e) {
        if (e.response != null) {
          return _helperMethods.responseGetter(responseEnum, e.response!);
        }

        await _ensureConnection();
        throw Exception(e.message ?? e.toString());
      } catch (e) {
        await _ensureConnection();
        throw Exception(e.toString());
      }
      return responseModel!;
    }
    return responseModel!;
  }

  @override
  Future<Response> httpDelete(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}) {
    return _performRequest(
      () => Dio().delete(
        _helperMethods.urlGenerator(url, query, pathVariable),
        data: body,
        options: Options(
          headers: _helperMethods.headerGetter(headerEnum),
        ),
      ),
      responseEnum,
      timeoutSeconds: timeoutSeconds,
    );
  }

  @override
  Future<Response> httpGet(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}) {
    return _performRequest(
      () => Dio().get(
        _helperMethods.urlGenerator(url, query, pathVariable),
        options: Options(
          headers: _helperMethods.headerGetter(headerEnum),
        ),
      ),
      responseEnum,
      timeoutSeconds: timeoutSeconds,
    );
  }

  @override
  Future<Response> httpPost(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}) {
    return _performRequest(
      () => Dio().post(
        _helperMethods.urlGenerator(url, query, pathVariable),
        data: body,
        options: Options(
          headers: _helperMethods.headerGetter(headerEnum),
        ),
      ),
      responseEnum,
      timeoutSeconds: timeoutSeconds,
    );
  }

  @override
  Future<Response> httpPut(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}) {
    return _performRequest(
      () => Dio().put(
        _helperMethods.urlGenerator(url, query, pathVariable),
        data: body,
        options: Options(
          headers: _helperMethods.headerGetter(headerEnum),
        ),
      ),
      responseEnum,
      timeoutSeconds: timeoutSeconds,
    );
  }

  @override
  Future<Response> httpPatch(
    String url,
    List<QueryModel>? query,
    String? pathVariable,
    dynamic body,
    HeaderEnum headerEnum,
    ResponseEnum responseEnum,
    {int? timeoutSeconds}) {
    return _performRequest(
      () => Dio().patch(
        _helperMethods.urlGenerator(url, query, pathVariable),
        data: body,
        options: Options(
          headers: _helperMethods.headerGetter(headerEnum),
        ),
      ),
      responseEnum,
      timeoutSeconds: timeoutSeconds,
    );
  }
}
