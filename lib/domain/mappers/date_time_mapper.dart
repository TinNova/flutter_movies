
import 'package:jiffy/jiffy.dart';

class DateTimeMapper {
  String formatDate(String releaseDate, String inputFormat, String outputFormat) {
    return Jiffy(releaseDate, inputFormat).format(outputFormat);
  }

  String getTimeString(int value) {
    final String hour = (value ~/ 60).toString();
    final String minutes = (value % 60).toString();
    return '${hour}h ${minutes}m';

  }
}
