import '../../feature/api_handler/data/models/response_model.dart';

abstract class UseCase<T> {
  Future<ResponseModel> call(T apiData);
}