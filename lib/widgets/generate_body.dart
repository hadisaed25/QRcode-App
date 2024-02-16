import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Core/colors.dart';
import '../Core/fuctions.dart';

// ignore: must_be_immutable
class GenerateQrWidget extends StatelessWidget {
   GenerateQrWidget({
    Key? key,
    required this.urlController,
  }) : super(key: key);

  final TextEditingController urlController;
  SizedBox sizeBoxVar = sizedBox();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: BackButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(deepBlue),
              ),
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when back button is pressed
              },
            ),
          ),
        ),
        sizeBoxVar,
        Card(
          margin: EdgeInsets.all(15),
          child: QrImageView(
            data: urlController.text,
            version: QrVersions.auto,
            size: 350.0,
          ),
        ),
        sizeBoxVar,
        Text(
          'Your QR Code Is Ready Now',
          style: styleOfText(fSize: 25.0),
        ),
      ],
    );
  }
}
