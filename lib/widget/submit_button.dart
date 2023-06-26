import 'package:flutter/material.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({super.key});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,
      vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: () {
          
        },
        child: const Center(child:  Text("Login"))),
    );
  }
}