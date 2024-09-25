class TaskModel{
  int? id;
  String? title;
  String? detail;

  TaskModel(this.title, this.detail);

  TaskModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    detail = json['detail'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['detail'] = this.detail;
    return data;
  }
}