import 'package:flutter/material.dart';
import 'package:flutter_application_1/card_group_med.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dateText = '';
  List<DateTime> meds = [];
  final formatter = DateFormat('d MMMM yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Medicações tomadas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TableCalendar(
            daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Colors.white),
                weekendStyle: TextStyle(color: Colors.white)),
            headerStyle: const HeaderStyle(
              leftChevronIcon: Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
              rightChevronIcon: Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(color: Colors.white),
            ),
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              disabledTextStyle: const TextStyle(color: Colors.white),
              weekendTextStyle: const TextStyle(color: Colors.white),
              weekNumberTextStyle: const TextStyle(color: Colors.white),
              defaultTextStyle: const TextStyle(color: Colors.white),
              selectedTextStyle: const TextStyle(color: Colors.green),
            ),
            availableCalendarFormats: const {CalendarFormat.month: 'month'},
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2025, 12, 31),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              // Retorne true para destacar a data selecionada
              return meds.any((selectedDay) => isSameDay(selectedDay, day));
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                if (meds.contains(selectedDay)) {
                  meds.remove(selectedDay);
                  dateText = '';
                } else {
                  
                  dateText = formatter.format(selectedDay);
                  meds.add(selectedDay);
                }
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              dateText,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white,
              child: ListView.builder(
                itemCount: meds.length,
                itemBuilder: (_, index) {
                  return  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CardGroupMed(
                      date: formatter.format(meds[index]),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
