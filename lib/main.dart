import 'package:araba_sevdasi/anasayfa.dart';
import 'package:araba_sevdasi/giris.dart';
import 'package:flutter/material.dart';
import 'package:araba_sevdasi/araba.dart';
import 'package:araba_sevdasi/benzin.dart';
import 'package:araba_sevdasi/profil.dart';
//

void main() {
  runApp(const Uygulama());
}

class Uygulama extends StatefulWidget {
  const Uygulama({super.key});

  @override
  State<Uygulama> createState() => UygulamaState();
}

class UygulamaState extends State<Uygulama> {
  void basla(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AnaMenu()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GirisEkrani(
              basla: basla,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

class AnaMenu extends StatefulWidget {
  const AnaMenu({super.key});

  @override
  State<AnaMenu> createState() => AnaMenuState();
}

class AnaMenuState extends State<AnaMenu> {
  var suAnkiIndex = 2;

  List<Widget> pageListFunc() => [
        Araba(),
        Benzin(),
        Anasayfa(),
        Profil(
          indexDegistir: temaDegistir,
        )
      ];

  var temaMod = Brightness.light;
  temaDegistir(int index) {
    setState(() {
      if (index == 1) {
        temaMod = Brightness.light;
      } else {
        temaMod = Brightness.dark;
      }
    });
  }

  void sayfaDegistir(index) {
    setState(() {
      suAnkiIndex = index;
    });
  }

  // ignore: non_constant_identifier_names
  IconData directions_car = const IconData(0xe1d7, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    var sayfalar = pageListFunc();
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.green.shade300,
        body: sayfalar[suAnkiIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 46, 154, 255),
              icon: Icon(Icons.directions_car),
              label: "Araba",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 255, 96, 96),
              icon: Icon(Icons.local_gas_station_rounded),
              label: "Yakıt",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 96, 238, 77),
              icon: Icon(Icons.home_rounded),
              label: "Ana Sayfa",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromARGB(255, 252, 82, 255),
              icon: Icon(Icons.person_pin_rounded),
              label: "Profil",
            ),
          ],
          currentIndex: suAnkiIndex,
          onTap: sayfaDegistir,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 51, 203, 255),
          brightness: temaMod,
        ),
      ),
    );
  }
}
