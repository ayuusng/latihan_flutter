import 'package:flutter/material.dart';
import 'package:hello_word_1/page/mainhome.dart';
//import 'package:hello_word_1/page/samplepage.dart';
// import 'package:perhitungan_volume/menu_page.dart';
// import 'package:perhitungan_volume/sample.dart'; // Sesuaikan dengan nama paket aplikasi Anda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Volume Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyRumah(),
    );
  }
}



