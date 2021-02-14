import 'date_utils.dart';

String validateTitle(String val) {
  return (val != null && val != "") ? null : "Title cannot be empty";
}

String getExpiryStr(String expires) {
  var e = convertToDate(expires);
  var td = new DateTime.now();
  Duration dif = e.difference(td);
  int dd = dif.inDays + 1;
  return (dd > 0) ? dd.toString() : "0";
}

bool strToBool(String str) {
  return int.parse(str) > 0;
}

bool intToBool(int val) {
  return val ?? 0 > 0;
}

String boolToStr(bool val) {
  return (val == true) ? "1" : "0";
}

int boolToInt(bool val) {
  return (val == true) ? 1 : 0;
}
