// url of the app or my github

import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

String myUrl = 'https://github.com/hadisaed25';
// dialog of rating
// final dialog = RatingDialog(
//     initialRating: 1.0,
//     // your app's name?
//     title: const Text(
//       'Rating My App',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 25,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     // encourage your user to leave a high rating?
//     message: const Text(
//       'Tap a star to set your rating. Add more description here if you want.',
//       textAlign: TextAlign.center,
//       style: TextStyle(fontSize: 15),
//     ),
//     // your app's logo?
//     starSize: 30,
//     showCloseButton: true,
//     submitButtonText: 'Submit',
//     commentHint: 'Set your custom comment hint',
//     onCancelled: () => print('cancelled'),
//     onSubmitted: (response) {
//       print('rating: ${response.rating}, comment: ${response.comment}');

//       if (response.rating < 3.0) {
//         // for example here i can sent the response to my gmail
//       }
//     });
