import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

void showProgressInicator(BuildContext context) {
  AlertDialog alertDialog = const AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Constants.myBlack),
      ),
    ),
  );
  showDialog(
    barrierColor:Constants.myWhite.withOpacity(0.0),
    barrierDismissible: false,
    context: context,
     builder:(context){
      return alertDialog;
     }
     );
}
