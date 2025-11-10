import 'package:flutter/material.dart';
import 'trip_detail_screen.dart';
import 'trip_result_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Trip Expense Calculation",
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const TripDetailsScreen(),
      '/result': (context) => const TripResultScreen(),
    },
  ));
}
