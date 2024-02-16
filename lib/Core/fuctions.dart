import 'package:flutter/material.dart';

import 'colors.dart';

// sized box fuction
SizedBox sizedBox({height = 20.0, width}) {
  // remember to declare the double var with double values
  return SizedBox(
    height: height,
    width: width,
  );
}

// elevated Button
ElevatedButton elevatedButtonMethod(
    {labelPa, iconPa, required Function onPressedPa, stylePa}) {
  return ElevatedButton.icon(
    label: labelPa,
    icon: iconPa,
    onPressed: () {
      // you have to put it in another fuction
      onPressedPa();
    },
    style: stylePa,
  );
}

//----------------------------------------------------------------
// style of text
TextStyle styleOfText({required double fSize, decorationPa}) {
  return TextStyle(
      fontSize: fSize,
      color: deepBlue,
      fontStyle: FontStyle.italic,
      decoration: decorationPa,
      decorationColor: deepBlue);
}

// snack Bar method
SnackBar snackBarMethod({content}) {
  return SnackBar(
      elevation: 100.0,
      closeIconColor: deepBlue,
      showCloseIcon: true,
      backgroundColor: lightBlue.withOpacity(0.3),
      content: content);
}

// fuction of the popUp menu method

PopupMenuItem<int> popUpMenuItemMethod({value, nameOfOption, nameOfIcon}) {
  return PopupMenuItem(
    textStyle: TextStyle(color: deepBlue),
    value: value,
    child: Row(
      children: <Widget>[
        Icon(
          nameOfIcon,
          color: deepBlue,
        ),
        Text('  $nameOfOption'),
      ],
    ),
  );
}
