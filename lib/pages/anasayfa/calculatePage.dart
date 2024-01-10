import 'package:araba_sevdasi/anaMenu.dart';
import 'package:araba_sevdasi/pages/anasayfa/araba_dondur2.dart';
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  final String distance;

  const Calculate({super.key, required this.distance});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Arabayı Seçiniz:",
            style: TextStyle(
              fontSize: 28,
              fontFamily: "Oswald",
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnaMenu()),
            );
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.background,
            size: 32,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 193, 40),
        foregroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Center(
        child: arabaDondur2(mesafe: widget.distance),
      ),
    );
  }
}
