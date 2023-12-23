import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

mixin DateTimeUtil {
  static String formatDateTimeToCustomString(DateTime dateTime) {
    initializeDateFormatting();

    ///TO DO : Add locale
    return DateFormat.yMMMd('en_TR').format(DateTime.now());
  }
}
