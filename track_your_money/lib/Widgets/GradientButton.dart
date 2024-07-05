import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  const GradientButton(
      {required this.onPressed, super.key, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(5, 144, 68, 0.66).withOpacity(0.3),
            offset: const Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(5, 144, 68, 0.66),
            Color.fromRGBO(5, 144, 68, 0.473)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        onPressed: () {
          widget.onPressed();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 40),
        ),
        child: Text(widget.text),
      ),
    );
  }
}
