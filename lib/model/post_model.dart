class PostModel {
  int? id;
  String? title;
  String? body;

  PostModel({this.id, this.title, this.body});

  PostModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];

  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}