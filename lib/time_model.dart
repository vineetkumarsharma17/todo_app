import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class TimeModel extends ChangeNotifier{
  String ?time;
  String? getTime() => time;
  updateRemainingTime()
  {
    final DateTime now = DateTime.now();
     time= DateFormat('hh:mm:ss').format(now);
    notifyListeners();
  }
}