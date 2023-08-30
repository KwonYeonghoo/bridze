import 'package:bridze/screen/style/calendar_style.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  CalendarAppState createState() => CalendarAppState();
}

class CalendarAppState extends State<CalendarApp> {
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "원하는 상담 날짜를 클릭해주세요",
                        style: TextStyle(
                          fontFamily: 'BMJUA',
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 500,
                  height: 400,
                  child: TableCalendar(
                    firstDay: DateTime.utc(2023, 7, 1),
                    lastDay: DateTime.utc(2023, 9, 30),
                    focusedDay: DateTime.now(),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDate = selectedDay;
                      });
                    },
                    calendarStyle: CustomCalendarStyle.customStyle,
                    headerStyle: const HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      titleTextStyle:
                          TextStyle(fontFamily: 'BMJUA', fontSize: 20),
                    ),
                  ),
                ),
                Text(
                  "날짜: ${_selectedDate.toLocal()}",
                  style: const TextStyle(fontSize: 20, fontFamily: 'BMJUA'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
