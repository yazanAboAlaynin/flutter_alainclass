import 'package:equatable/equatable.dart';

class News extends Equatable {
  final int id;
  final String title;
  final String date;
  final String content;
  final String image;
  final String link;

  News({
    this.id,
    this.title,
    this.date,
    this.content,
    this.image,
    this.link,
  });

  @override
  List<Object> get props => [
        id,
        title,
        date,
        content,
        image,
        link,
      ];

  static News fromJson(dynamic json) {
    return News(
      id: json['ID'],
      title: json['Title'],
      date: json['Date'],
      content: json['content'],
      image: json['img'],
      link: json['link'],
    );
  }
}
