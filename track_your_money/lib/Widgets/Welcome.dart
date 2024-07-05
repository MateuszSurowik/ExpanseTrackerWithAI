import 'package:flutter/material.dart';
import 'package:track_your_money/Widgets/Logining.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.swapper});
  final void Function(int value) swapper;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Image(image: Image.asset('lib/assets/logo.png').image),
            const SizedBox(
              height: 60,
            ),
            Logining(swapper: widget.swapper),
          ],
        ),
      ),
    );
  }
}
