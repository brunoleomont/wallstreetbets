class Post {
  String ticker = '';
  String sentiment = '';
  int comments = 0;
  double sentimentScore = 0;

  Post({this.ticker = '', this.sentiment = '', this.comments = 0, this.sentimentScore = 0});

  Post.fromJson(Map<String, dynamic> json) {
    this.ticker = json['ticker'];
    this.sentiment = json['sentiment'];
    this.comments = json['no_of_comments'];
    this.sentimentScore = json['sentiment_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticker'] = this.ticker;
    data['sentiment'] = this.sentiment;
    data['no_of_comments'] = this.comments;
    data['sentiment_score'] = this.sentimentScore;
    return data;
  }
}
