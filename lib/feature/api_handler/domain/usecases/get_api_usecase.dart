
import 'package:api_handler/core/usecase/usecase.dart';
import 'package:api_handler/feature/api_handler/data/datasource/api_remote_datasource.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/api_data/api_data.dart';
import '../../data/models/response_model.dart';


class GetApi implements UseCase<GetApiData> {
  /// calls the 'Get' API with data provided in `GetApiData`.
  @override
  Future<Response> call(GetApiData apiData) async {
    ApiRemoteDataSourceImpl remoteDataSourceImpl = ApiRemoteDataSourceImpl();

    Response response = await remoteDataSourceImpl.httpGet(
      apiData.url,
      apiData.queries,
      apiData.pathVars,
      apiData.headerEnum,
      apiData.responseEnum,
    );

    return response;
  }
}