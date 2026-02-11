import 'package:flutter/material.dart';
import 'ui/screens/ride_search/ride_search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ride Search',
      theme: ThemeData(useMaterial3: true),
      home: const RideSearchScreen(),
    );
  }
}
