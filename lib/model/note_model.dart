class NoteModel {
  int? id;
  String? title;
  String? content;
  NoteModel({this.id, this.title, this.content});

  NoteModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.content;
    return data;
  }
}