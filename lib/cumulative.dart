import 'package:flutter/material.dart';
import 'package:goodhabbitsmonitor/habit.dart';
import 'package:collection/collection.dart';

class CumCounter extends InheritedWidget {
  List<Habit> habits = [];
  Widget child;

  CumCounter({this.child});

  @override
  bool updateShouldNotify(CumCounter oldWidget) {
    return !IterableEquality().equals(habits, oldWidget.habits);
  }

  static CumCounter of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}