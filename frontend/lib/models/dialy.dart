import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Letter {
  final String content;
  final DateTime date;

  Letter({required this.content, required this.date});

  factory Letter.fromJson(Map<String, dynamic> json) {
    return Letter(
      content: json['content'],
      date: DateTime.parse(json['date']),
    );
  }
}

class Profile {
  final String username;
  final String introduction;
  final String icon;

  Profile({required this.username, required this.introduction, required this.icon});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      username: json['username'],
      introduction: json['introduction'],
      icon: json['icon'],
    );
  }
}

class Dialy {
  final String userName;
  final String dialyText;
  final DateTime updatedDate;

  Dialy({
    required this.userName,
    required this.dialyText,
    required this.updatedDate,
  });

  String get formattedDate {
    return "${updatedDate.year}-${updatedDate.month}-${updatedDate.day}";
  }

  factory Dialy.fromJson(Map<String, dynamic> json) {
    return Dialy(
      userName: json['profile']['username'],
      dialyText: json['letters'][0]['content'],  // 必要に応じて調整
      updatedDate: DateTime.parse(json['letters'][0]['date']),
    );
  }
}
