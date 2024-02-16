import 'package:flutter/material.dart';
import 'package:qr_code/Core/colors.dart';
import 'package:qr_code/Screens/generate_qr_page.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:rate_my_app/rate_my_app.dart';
// import 'package:share_it/share_it.dart';

import '../Core/fuctions.dart';
import '../Core/images.dart';

// ignore: must_be_immutable
class HomeBody extends StatelessWidget {
  HomeBody({
    super.key,
  });

// declare a instance from textEditingController
  TextEditingController urlController = TextEditingController();
// dialog of rating

// fuction to check if the url is match or not by using Reguar Expression Regex
  bool? isValidUrl(String url) {
    final RegExp urlRegex = RegExp(
        r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$');

    return urlRegex.hasMatch(url);
  }

  @override
  Widget build(BuildContext context) {
    final dialog = RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title: const Text(
          'Rating My App',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: const Text(
          'Tap a star to set your rating. Add more description here if you want.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        // your app's logo?
        starSize: 30,
        showCloseButton: true,
        submitButtonText: 'Submit',
        commentHint: 'Set your custom comment hint',
        onCancelled: () => print('cancelled'),
        onSubmitted: (response) {
          if (response.comment.isNotEmpty || response.rating >= 1.0) {
            ScaffoldMessenger.of(context).showSnackBar(snackBarMethod(
                content: Text(
                    'Thank you for rating us ${String.fromCharCode(0x1F929)}')));
          } else {}
          print('rating: ${response.rating}, comment: ${response.comment}');

          if (response.rating < 3.0) {
            // for example here i can sent the response to my gmail
          }
        });
    // fuction to navigate from home page to generate page
    toGeneratePage(c) {
      // check if the url is not empty
      if (urlController.text.isNotEmpty) {
        if (isValidUrl(urlController.text)!) {
          Navigator.push(
              c,
              MaterialPageRoute(
                builder: (context) => GenerateQr(
                  urlController: urlController,
                ),
              ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(snackBarMethod(
              content: Row(
            children: [
              Icon(
                Icons.warning,
                color: deepBlue,
              ),
              Text(
                'The Url is not valid',
                style: styleOfText(
                    fSize: 23.0, decorationPa: TextDecoration.underline),
              ),
            ],
          )));
        }
      } else {
        // i will use snackBar to alert the user to enter the Url
        ScaffoldMessenger.of(context).showSnackBar(snackBarMethod(
            content: Row(
          children: [
            Icon(
              Icons.warning,
              color: deepBlue,
            ),
            Text('The field is empty',
                style: styleOfText(
                    fSize: 23.0, decorationPa: TextDecoration.underline)),
          ],
        )));
      }
    }

// the body of the home page start form here
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // i will create a popup menue here
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 5),
              child: PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return [
                    popUpMenuItemMethod(
                        value: 1,
                        nameOfOption: 'About App',
                        nameOfIcon: Icons.info),
                    popUpMenuItemMethod(
                        value: 2,
                        nameOfOption: 'Share App',
                        nameOfIcon: Icons.share),
                    // change it later
                    PopupMenuItem(
                      textStyle: TextStyle(color: deepBlue),
                      value: 3,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.rate_review,
                            color: deepBlue,
                          ),
                          const Text('  Rate App'),
                        ],
                      ),
                    )
                  ];
                },
                onSelected: (value) {
                  if (value == 1) {
                    showAboutDialog(
                      children: [
                        const Text('App to Create a QRcode built in Flutter')
                      ],
                      context: context,
                      applicationName: 'Create QRcode',
                      applicationVersion: 'v1.0.0',
                      applicationIcon: Image.asset(
                        qrLogo,
                        width: 70.0,
                      ),
                    );
                  } else if (value == 2) {
                    Share.share('https://github.com/hadisaed25/',
                        subject: 'Hello Welcome to My App');
                  } else if (value == 3) {
                    showDialog(
                      context: context,
                      barrierDismissible:
                          true, // set to false if you want to force a rating
                      builder: (context) => dialog,
                    );
                  }
                },
              ),
            ),
          ),
          // the image logo of the app
          Center(
            child: Image.asset(
              qrLogo,
              width: 250.0,
            ),
          ),
          // the text
          sizedBox(),
          Text(
            'Please provide the URL\n    you\'d like to create',
            // the style of the text
            style: styleOfText(fSize: 25.0),
          ),
          sizedBox(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            // the text field
            child: TextField(
              // keyboardAppearance: null,

              // the controller of the text
              controller: urlController,
              // the color of cursor
              cursorColor: deepBlue,
              // the decoration of the text filed
              decoration: InputDecoration(
                  suffix: IconButton(
                      onPressed: () {
                        urlController.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        color: deepBlue,
                      )),
                  hintText: ' Enter the url here...',
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
            // elvated button with icon
          ),
          // elevated method button to make it usable
          sizedBox(),
          elevatedButtonMethod(
              labelPa: const Text('Generate',
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              iconPa: const Icon(
                Icons.arrow_forward,
              ),
              stylePa: ElevatedButton.styleFrom(
                  fixedSize: const Size(150.0,
                      50.0), // use fixed size to control the size of the button
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  foregroundColor: white,
                  backgroundColor: deepBlue),
              onPressedPa: () {
                toGeneratePage(context);
              }),
        ],
      ),
    );
  }
}
