import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';


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
  final List<String> contents;
  final List<DateTime> dates;
  final String imageUrl; // 画像のURLフィールドを追加

  Dialy({
    required this.userName,
    required this.contents,
    required this.dates,
    required this.imageUrl, // 画像URLも必須パラメータに追加
  });

  // JSONからDialyオブジェクトを生成するファクトリーメソッド
  factory Dialy.fromJson(Map<String, dynamic> json) {
    final letters = json['letters'];
    List<String> contents = [];
    List<DateTime> dates = [];
    for (var letter in letters) {
      contents.add(letter['content']);
      dates.add(DateTime.parse(letter['date']));
    }

    return Dialy(
      userName: json['profile']['username'],
      contents: contents,
      dates: dates,
      imageUrl: json['profile']['icon'] ?? '', // nullチェックをしてデフォルト値を設定
    );
  }
}
