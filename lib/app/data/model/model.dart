class Post {
  int id = 0;
  String title = '';
  String body = '';

  Post({this.id = 0, this.title = '', this.body = ''});

  Post.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
