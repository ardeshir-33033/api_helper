import 'package:dio/dio.dart';

import '../../feature/api_handler/data/models/response_model.dart';

abstract class UseCase<T> {
  Future<Response> call(T apiData);
}