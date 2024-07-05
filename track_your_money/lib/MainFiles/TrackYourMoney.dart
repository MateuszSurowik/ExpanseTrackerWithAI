import 'package:flutter/material.dart';
import 'package:track_your_money/Pages/ChatPage.dart';
import 'package:track_your_money/Pages/MainPage.dart';
import 'package:track_your_money/Pages/TrackerPage.dart';

class TrackYourMoney extends StatefulWidget {
  const TrackYourMoney({super.key});

  @override
  State<TrackYourMoney> createState() => _TrackYourMoneyState();
}

class _TrackYourMoneyState extends State<TrackYourMoney> {
  int value = 1;
  Widget? currentPage;
  void swapper(value2) {
    value = value2;
    switch (value2) {
      case 1:
        currentPage = MainPage(swapper: swapper);
        setState(() {});
      case 2:
        currentPage = TrackerPage(swapper: swapper);
        setState(() {});
      case 3:
        currentPage = ChatPage();
        setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body: value == 1
          ? currentPage = MainPage(swapper: swapper)
          : currentPage = currentPage);
}
