import 'package:api_handler/core/usecase/usecase.dart';
import 'package:api_handler/feature/api_handler/data/datasource/api_remote_datasource.dart';
import '../../../../core/models/api_data/api_data.dart';
import '../../data/models/response_model.dart';


class DeleteApi implements UseCase<DeleteApiData> {
  /// calls the 'Delete' API with data provided in [DeleteApiData].
  @override
  Future<ResponseModel> call(DeleteApiData apiData) async {
    ApiRemoteDataSourceImpl remoteDataSourceImpl = ApiRemoteDataSourceImpl();

    ResponseModel response = await remoteDataSourceImpl.httpDelete(
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