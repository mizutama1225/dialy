import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Dialy {
  Dialy({
    required this.userName,
    required this.dialyText,
    required this.updatedDate,
  });
  final String dialyText;
  final String userName;
  final DateTime updatedDate;

  String get formattedDate {
    initializeDateFormatting('ja');

    return DateFormat.MMMd('ja').format(updatedDate);
  }
}
