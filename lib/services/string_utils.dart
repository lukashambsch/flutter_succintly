import 'package:intl/intl.dart';

String validateTitle(String val) {
  return (val != null && val != "") ? null : "Title cannot be empty";
}

String getExpiryStr(String expires) {
  var e = DateUtils.convertToDate(expires);
  var td = new DateTime.now();
  Duration dif = e.difference(td);
  int dd = dif.inDays + 1;
  return (dd > 0) ? dd.toString() : "0";
}

bool strToBool(String str) {
  return (int.parse(str) > 0) ? true : false;
}

bool intToBool(int val) {
  return (val > 0) ? true : false;
}

String boolToStr(bool val) {
  return (val == true) ? "1" : "0";
}

int boolToInt(bool val) {
  return (val == true) ? 1 : 0;
}
