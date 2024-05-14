import '../../../feature/api_handler/data/enums/header_enum.dart';
import '../../../feature/api_handler/data/enums/response_enum.dart';
import '../../../feature/api_handler/data/models/query_model.dart';

abstract class ApiData {
  String url;
  HeaderEnum headerEnum;
  ResponseEnum responseEnum;
  List<QueryModel>? queries;
  String? pathVars;

  ApiData(
    this.url, {
    this.queries,
    this.pathVars = '',
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

  GetApiData(
    this.url, {
    this.queries,
    required this.headerEnum,
    this.pathVars,
    required this.responseEnum,
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

  PostApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
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

  PutApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
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

  PatchApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
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

  DeleteApiData(
    this.url, {
    this.body,
    required this.headerEnum,
    this.pathVars,
    this.queries,
    required this.responseEnum,
  });
}
