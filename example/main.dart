import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:thai_datetime_format/thai_datetime_format.dart';

void main() {
  Intl.defaultLocale = "th";
  initializeDateFormatting();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nextflow Flutter Widget Today',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 3 นาที: วันเดือนปีไทยๆ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    var now = DateTime.now();
    var onlyBuddhistYear = now.yearInThaiCalendar;

    var formatter = DateFormat.yMMMMEEEEd();
    var dateInBuddhistCalendarFormat = formatter.formatInThaiCalendar(now);

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Text('$dateInBuddhistCalendarFormat --- $onlyBuddhistYear'),
        ));
  }
}
