
import 'package:api_handler/core/usecase/usecase.dart';
import 'package:api_handler/feature/api_handler/data/datasource/api_remote_datasource.dart';

import '../../../../core/models/api_data/api_data.dart';
import '../../data/models/response_model.dart';


class PutApi implements UseCase<PutApiData> {
  /// calls the Put API with data provided in [PutApiData].
  @override
  Future<ResponseModel> call(PutApiData apiData) async {
    ApiRemoteDataSourceImpl remoteDataSourceImpl = ApiRemoteDataSourceImpl();

    ResponseModel response = await remoteDataSourceImpl.httpPut(
      apiData.url,
      apiData.queries,
      apiData.pathVars,
      apiData.body,
      apiData.headerEnum,
      apiData.responseEnum,
    );

    return response;
  }
}