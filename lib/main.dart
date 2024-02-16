import 'package:flutter/material.dart';
import 'package:qr_code/Screens/home_page.dart';

void main() {
  runApp(const QrApp());
}

class QrApp extends StatelessWidget {
  const QrApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeQR(),
    );
  }
}
