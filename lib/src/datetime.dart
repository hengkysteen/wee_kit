import 'package:intl/intl.dart';

class WeeDateTime {
  static DateTime stringToDate(String data) {
    return DateTime.parse(data);
  }

  static String dateToString(DateTime data, [String? pattern, String? locale]) {
    return DateFormat(pattern ?? "EEEE, dd MMMM yyyy", locale).format(data);
  }

  static String toTimeAgo(DateTime dateTime) {
    final Duration diff = DateTime.now().difference(dateTime);
    if (diff.inDays > 8) {
      return DateFormat('MMM d, yyyy').format(dateTime);
    } else if (diff.inDays == 8) {
      return 'yesterday';
    } else if (diff.inDays >= 1) {
      final int days = diff.inDays;
      return '$days day${days == 1 ? "" : "s"} ago';
    } else if (diff.inHours >= 1) {
      final int hours = diff.inHours;
      return '$hours hour${hours == 1 ? "" : "s"} ago';
    } else if (diff.inMinutes >= 1) {
      final int minutes = diff.inMinutes;
      return '$minutes minute${minutes == 1 ? "" : "s"} ago';
    } else {
      return 'just now';
    }
  }
}
