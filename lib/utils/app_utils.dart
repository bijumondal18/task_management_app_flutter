import 'package:intl/intl.dart';

class AppUtils{
  DateTime now = DateTime.now();

  List months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER'
  ];

  String getCurrentDate() {
    var formatterDate = DateFormat('dd');
    String actualDate = formatterDate.format(now);
    return actualDate;
  }

  String getCurrentYear() {
    var formatterDate = DateFormat('yyyy');
    String actualYear = formatterDate.format(now);
    return actualYear;
  }

  String getCurrentMonthName() {
    var actualMonth = now.month;
    return months[actualMonth-1];
  }

  String getCurrentDayName() {
    var formatterDate = DateFormat('EEEE');
    String actualDay = formatterDate.format(now);
    return actualDay;
  }

  String getCurrentTime() {
    var formatterTime = DateFormat('kk:mm');
    String actualTime = formatterTime.format(now);
    return actualTime;
  }

}