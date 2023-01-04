import 'package:flutter/material.dart';

showSuccessDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        // Image.asset('assets/img/success.gif'),
        // Lottie.asset("assets/lottie/success.json", height: 120),
        SizedBox(
          height: 12,
        ),
        Text(
          "Job done!",
          style: TextStyle(
              color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showWeWillTryLaterDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/img/no_internet.gif'),
        //\nNe t'inquiète pas! Vos données sont enregistrées localement.
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Something happned with the network, we will try again later.",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
