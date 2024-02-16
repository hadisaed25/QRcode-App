import 'package:flutter/material.dart';
import '../widgets/home_body.dart';

class HomeQR extends StatelessWidget {
  const HomeQR({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset:
              true // adjust the layout when keybord appear
          ,
          body: HomeBody()),
    );
  }
}
