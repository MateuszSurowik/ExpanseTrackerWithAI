import 'package:flutter/material.dart';
import 'package:track_your_money/Widgets/GradientButton.dart';

class Logining extends StatefulWidget {
  const Logining({super.key, required this.swapper});
  final void Function(int value) swapper;

  @override
  State<Logining> createState() => _LoginingState();
}

class _LoginingState extends State<Logining> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(0, 5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: SizedBox(
        height: 250,
        width: 300,
        child: Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 260,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Email",
                      filled: true,
                      fillColor: Color(0x04AA6D),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 260,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "Password",
                      filled: true,
                      fillColor: Color(0x04AA6D),
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientButton(
                    text: "Sing Up",
                    onPressed: () {
                      widget.swapper(2);
                    },
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  GradientButton(
                    text: "Sing In",
                    onPressed: () {
                      widget.swapper(2);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
