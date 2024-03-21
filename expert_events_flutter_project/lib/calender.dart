import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;
  late LinkedHashMap<DateTime, List<Event>> events;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    _selectedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    events = LinkedHashMap(
      equals: isSameDay,
      hashCode: getHashCode,
    );
    fetchEvents(); // Fetch events from Firebase
  }

  // Function to fetch events from Firebase
  void fetchEvents() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Events').get();
    setState(() {
      events = LinkedHashMap(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      for (var doc in snapshot.docs) {
        events[doc['date'].toDate()] =
            List<Event>.from(doc['events'].map((e) => Event.fromJson(e)));
      }
    });
  }

  // Function to add event
  void addEvent(Event event) {
    setState(() {
      if (events.containsKey(event.date)) {
        events[event.date]!.add(event);
      } else {
        events[event.date] = [event];
      }
    });
    // Update events in Firebase
    FirebaseFirestore.instance
        .collection('events')
        .doc(event.date.toString())
        .set({
      'date': event.date,
      'events': events[event.date]!.map((e) => e.toJson()).toList(),
    });
  }

  // Function to remove event
  void removeEvent(Event event) {
    setState(() {
      if (events.containsKey(event.date)) {
        events[event.date]!.removeWhere(
            (e) => e.name == event.name && e.description == event.description);
        if (events[event.date]!.isEmpty) {
          events.remove(event.date);
        }
      }
    });
    // Update events in Firebase
    FirebaseFirestore.instance
        .collection('events')
        .doc(event.date.toString())
        .set({
      'date': event.date,
      'events': events[event.date]!.map((e) => e.toJson()).toList(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              focusedDay: _focusedDay,
              firstDay: _firstDay,
              lastDay: _lastDay,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: const CalendarStyle(
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 198, 206, 248),
                ),
              ),
              eventLoader: (day) {
                return events[day] ?? [];
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add event button action
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Event'),
                content: Text('Dialog content here.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Add event logic here
                      // Example:
                      final newEvent = Event(
                        date: _selectedDay,
                        name: 'New Event',
                        description: 'Description of new event.',
                      );
                      addEvent(newEvent);
                      Navigator.of(context).pop();
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Event {
  final DateTime date;
  final String name;
  final String description;

  Event({
    required this.date,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'name': name,
      'description': description,
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: json['date'].toDate(),
      name: json['name'],
      description: json['description'],
    );
  }
}

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
