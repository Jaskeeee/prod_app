import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key});

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.now(),
      lastDay: DateTime(2099),
      focusedDay: focusedDay,
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      onDaySelected: (selected, focused) {
        setState(() {
          selectedDay = selected;
          focusedDay = focused;
        });
      },
      calendarStyle: CalendarStyle(
        todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
        todayDecoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        selectedDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        selectedTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}