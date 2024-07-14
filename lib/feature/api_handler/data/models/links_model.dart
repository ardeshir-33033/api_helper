class LinksModel {
  String? next;
  String? previous;

  LinksModel({this.next, this.previous});

  LinksModel fromJson(Map<String, dynamic> json) {
    return LinksModel(next: json['next'], previous: json['previous']);
  }
}
