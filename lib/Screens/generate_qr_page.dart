import 'package:flutter/material.dart';

import '../widgets/generate_body.dart';

// ignore: must_be_immutable
class GenerateQr extends StatelessWidget {
  GenerateQr({super.key, required this.urlController});
  TextEditingController urlController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GenerateQrWidget(urlController: urlController),
      ),
    );
  }
}
