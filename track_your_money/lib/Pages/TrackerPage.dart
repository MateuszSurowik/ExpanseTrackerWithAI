import 'package:flutter/material.dart';
import 'package:track_your_money/Models/Model_Expanse.dart';
import 'package:track_your_money/Widgets/NewExpanse.dart';
import 'package:track_your_money/main.dart';
import 'package:intl/intl.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key, required this.swapper});
  final void Function(int value) swapper;

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  String Formatter(DateTime date) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(date);
    return formattedDate;
  }

  List<Expanse> listOfExpanses = [];

  void addExpanse(
      String title, double amount, DateTime date, Category category) {
    setState(() {
      listOfExpanses.add(Expanse(
          title: title, amount: amount, date: date, category: category));
    });
  }

  void show() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpanse(
              addExpanse: addExpanse,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(1, 19, 206, 81).withOpacity(0.05),
            Color.fromARGB(1, 255, 255, 255)
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromARGB(1, 0, 255, 85).withOpacity(0.2),
              Color.fromARGB(1, 255, 255, 255)
            ],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Color.fromARGB(255, 141, 206, 129),
              elevation: 8,
              shadowColor: kColor.primary,
              actions: [
                Expanded(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/AppBarImage.png",
                            width: 360,
                            height: 180,
                          ),
                        ],
                      ),
                      Positioned(
                        right: 5,
                        child: IconButton(
                          onPressed: show,
                          icon: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView(
                          children: [
                            ...listOfExpanses.map(
                              (e) => Card(
                                elevation: 5,
                                shadowColor: kColor.primary,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  child: Column(
                                    children: [
                                      Text("${e.title} - ${e.category.name}"),
                                      Row(
                                        children: [
                                          Text("\$${e.amount.toString()}"),
                                          Spacer(),
                                          Text(Formatter(e.date)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: IconButton(
                      onPressed: () {
                        widget.swapper(3);
                      },
                      icon: Icon(Icons.chat),
                      style: IconButton.styleFrom(
                        shape: CircleBorder(
                          side: BorderSide(style: BorderStyle.none),
                        ),
                        backgroundColor: Color.fromARGB(255, 141, 206, 129),
                        padding: EdgeInsets.all(18),
                        elevation: 10,
                        shadowColor: kColor.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
