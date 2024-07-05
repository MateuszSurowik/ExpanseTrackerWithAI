import 'package:flutter/material.dart';

class TextFieldWithShadow extends StatefulWidget {
  const TextFieldWithShadow(this.prefix,
      {required this.text, required this.controller, super.key});
  final String prefix;
  final String text;
  final TextEditingController controller;
  @override
  State<TextFieldWithShadow> createState() => _TextFieldWithShadowState();
}

class _TextFieldWithShadowState extends State<TextFieldWithShadow> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          width: 200,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 239, 239, 239),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 1),
                  blurRadius: 1,
                  spreadRadius: 2,
                )
              ]),
          child: Text(""),
        ),
        Positioned(
          height: 50,
          width: 200,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            controller: widget.controller,
            maxLength: 20,
            decoration: InputDecoration(
              prefix: Text(widget.prefix),
              counterText: "",
              hintText: widget.text,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
