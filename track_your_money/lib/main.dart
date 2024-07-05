import 'package:flutter/material.dart';
import 'package:track_your_money/MainFiles/TrackYourMoney.dart';

var kColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 125, 176, 100),
);
var kColor2 = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 145, 112, 202),
);
main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              backgroundColor: kColor.primary, foregroundColor: Colors.black),
        ),
        cardTheme: CardTheme(
          shadowColor: kColor.shadow,
          color: Color.fromARGB(255, 249, 249, 249),
        ),
        primaryTextTheme: const TextTheme(
          displayLarge: TextStyle(color: Colors.black),
          displayMedium: TextStyle(color: Colors.black),
          displaySmall: TextStyle(color: Colors.black),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const TrackYourMoney(),
    ),
  );
}
