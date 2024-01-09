import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("calculate page")),
    );
  }
}