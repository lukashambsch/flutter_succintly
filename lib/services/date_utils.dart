import 'package:intl/intl.dart';

DateTime convertToDate(String input) {
  try {
    var d = new DateFormat("yyyy-MM-dd").parseStrict(input);
    return d;
  } catch (e) {
    return null;
  }
}

String convertToDateFull(String input) {
  try {
    var d = new DateFormat("yyyy-MM-dd").parseStrict(input);
    var formatter = new DateFormat('dd MMM yyyy');
    return formatter.format(d);
  } catch (e) {
    return null;
  }
}

String convertToDateFullDt(DateTime input) {
  try {
    var formatter = new DateFormat('dd MMM yyyy');
    return formatter.format(input);
  } catch (e) {
    return null;
  }
}

bool isDate(String dt) {
  try {
    var d = new DateFormat("yyyy-MM-dd").parseStrict(dt);
    return true;
  } catch (e) {
    return false;
  }
}

bool isValidDate(String dt) {
  if (dt.isEmpty || !dt.contains("-") || dt.length < 10) return false;
  List<String> dtItems = dt.split("-");
  var d = DateTime(
      int.parse(dtItems[0]), int.parse(dtItems[1]), int.parse(dtItems[2]));
  return d != null && isDate(dt) && d.isAfter(new DateTime.now());
}

// String functions
String daysAheadAsStr(int daysAhead) {
  var now = new DateTime.now();
  DateTime ft = now.add(new Duration(days: daysAhead));
  return ftDateAsStr(ft);
}

String ftDateAsStr(DateTime ft) {
  return ft.year.toString() +
      "-" +
      ft.month.toString().padLeft(2, "0") +
      "-" +
      ft.day.toString().padLeft(2, "0");
}

String TrimDate(String dt) {
  if (dt.contains(" ")) {
    List<String> p = dt.split(" ");
    return p[0];
  } else
    return dt;
}
