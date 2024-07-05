import 'package:flutter/material.dart';
import 'package:track_your_money/Widgets/Welcome.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.swapper});
  final void Function(int value) swapper;
  @override
  State<MainPage> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(28, 154, 65, 0.729),
            Color.fromRGBO(28, 154, 65, 0.425),
          ],
        ),
      ),
      child: Welcome(
        swapper: widget.swapper,
      ),
    );
  }
}
