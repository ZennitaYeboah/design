import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'dart:async';

void main(List<String> args) {
  runApp(Shopper());
}

class Shopper extends StatefulWidget {
  const Shopper({Key? key}) : super(key: key);

  @override
  _ShopperState createState() => _ShopperState();
}

class _ShopperState extends State<Shopper> {
  late ThemeData? _selectedTheme;

  ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );

  ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );

  /// Timer will be required to change the theme after some time.
  late Timer? _timer;
  @override
  void initState() {
    _selectTheme();

    super.initState();
  }

  _selectTheme() {
    // Current time
    DateTime now = DateTime.now();
    // Dark theme start time evening 7 pm
    DateTime darkThemeStartTime = DateTime(now.year, now.month, now.day, 19);
    // Dark theme to Light switch happen at 6 am
    DateTime darkThemeEndTime = DateTime(now.year, now.month, now.day, 6);

    // time left to change the theme
    int timerSeconds;

    // if current time is after 6 am & before 7 pm then light theme else dark theme
    if (now.compareTo(darkThemeEndTime) > 0 &&
        now.compareTo(darkThemeStartTime) < 0) {
      // time between 6 am and 7 pm
      print('lightTheme');
      _selectedTheme = _lightTheme;
      // theme will be changed at 7 pm
      timerSeconds = darkThemeStartTime.difference(now).inSeconds;
    } else if (now.compareTo(darkThemeStartTime) > 0) {
      // time after 7 pm
      print('darkTheme');
      _selectedTheme = _darkTheme;
      DateTime nextDayMorningTime = darkThemeStartTime.add(Duration(days: 1));
      timerSeconds = nextDayMorningTime.difference(now).inSeconds;
    } else {
      // time before 6 am
      print('darkTheme');
      _selectedTheme = _darkTheme;
      timerSeconds = darkThemeEndTime.difference(now).inSeconds;
    }

    _timer = Timer(
      Duration(seconds: timerSeconds),
      () {
        //_selectTheme will be called after speciefied time
        _selectTheme();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      themeMode: ThemeMode.system,
      home: HomePage(),
    );
  }
}
