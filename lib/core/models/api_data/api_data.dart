import '../../../feature/api_handler/data/enums/header_enum.dart';
import '../../../feature/api_handler/data/enums/response_enum.dart';
import '../../../feature/api_handler/data/models/query_model.dart';

abstract class ApiData {
  String url;
  HeaderEnum headerEnum;
  ResponseEnum responseEnum;
  List<QueryModel>? queries;
  String? pathVars;
  int? timeout;

  ApiData(
    this.url, {
    this.queries,
    this.pathVars = '',
    this.timeout,
    required this.headerEnum,
    required this.responseEnum,
  });
}

class GetApiData implements ApiData {
  @override
  late String url;

  @override
  HeaderEnum headerEnum;

  @override
  String? pathVars;

  @override
  List<QueryModel>? queries;

  @override
  var responseEnum;

  @override
  int? timeout;

  GetApiData(
    this.url, {
    this.queries,
    required this.headerEnum,
    this.pathVars,
    required this.responseEnum,
    this.timeout,
  });
}

class PostApiData implements ApiData {
  @override
  late String url;

  @override
  HeaderEnum headerEnum;

  @override
  String? pathVars;

  @override
  List<QueryModel>? queries;

  @override
  ResponseEnum responseEnum;

  dynamic body;

  @override
  int? timeout;

  PostApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
    this.timeout,
  });
}

class PutApiData implements ApiData {
  @override
  late String url;

  @override
  HeaderEnum headerEnum;

  @override
  String? pathVars;

  @override
  List<QueryModel>? queries;

  @override
  ResponseEnum responseEnum;

  dynamic body;

  @override
  int? timeout;

  PutApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
    this.timeout,
  });
}

class PatchApiData implements ApiData {
  @override
  late String url;

  @override
  HeaderEnum headerEnum;

  @override
  String? pathVars;

  @override
  List<QueryModel>? queries;

  @override
  ResponseEnum responseEnum;

  dynamic body;

  @override
  int? timeout;

  PatchApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
    this.timeout,
  });
}

class DeleteApiData implements ApiData {
  @override
  late String url;

  @override
  HeaderEnum headerEnum;

  @override
  String? pathVars;

  @override
  List<QueryModel>? queries;

  @override
  ResponseEnum responseEnum;

  dynamic body;

  @override
  int? timeout;

  DeleteApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
    this.timeout,
  });
}
