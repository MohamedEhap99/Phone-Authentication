// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static var API_URL = "";

  static const String APP_NAME = "wafaa";
  static const String APP_LINK = "https://wafaa.om/";
  static const String APP_VERSION = "v1.0";



  static const String ANDROID_LINK =
      "https://play.google.com/store/apps/details?id=ma.goviral.wafaa";
  static const String IOS_LINK = "";

  //ADMOB
  static String ANDROID_APP_ID = "";
  static String ANDROID_BANNER_AD_ID = "";
  static String ANDROID_INTERSTITIAL_AD_ID = "";

  static String IOS_APP_ID = "";
  static String IOS_BANNER_AD_ID = "";
  static String IOS_INTERSTITIAL_AD_ID = "";

  static int REPEAT_INTERSTITIAL = 3;

  static bool SHOW_BANNER = true;
  static bool SHOW_INTERSTITIAL = true;

  static bool SHOW_FREEADS_OFFER = true;

  static int SHARE_WITH = 10;

  static Map? ANNOUNCEMENTS = {};

  // Style constants
  static const Color COLOR_PRIMARY = Color(0xFFFFFFFF);
  static const Color COLOR_SECONDARY = Color(0xFFFFFFFF);

  static const Color COLOR_BG = Color.fromARGB(255, 31, 31, 31);

  static const Color COLOR_FACEBOOK = Color(0xFF3b5998);
  static const Color COLOR_GOOGLE = Color(0xFFd34836);

  static const Color COLOR_DANGER = Colors.redAccent;
  static const Color COLOR_INFO = Colors.lightBlueAccent;
  static const Color COLOR_WARNING = Color(0xFFFF8F00);
  static const Color COLOR_COOL = Colors.lightGreenAccent;

  static const Color COLOR_TEXT = Color(0xFF111E23);
  static const Color COLOR_TITLE = Color(0xFFC1B560);

  static const Color COLOR_TOP = Color(0xFFC1B560);
  static const Color COLOR_BOTTOM = Color(0xFF15274B);

  static const Color myBlack = Colors.black;
  static const Color myWhite = Colors.white;
  static const Color blue = Color(0xff0666EB);
  static const Color lightBlue = Color(0xffE5EFFD);
  static const Color lightGrey = Color(0xffE1E1E1);

  static const double minOrder = 50;

  static const String TERMS_AND_CONDITIONS_URL =
      'https://wafaa.om/conditions.html';

  static const kGoogleApiKey = "";
  static const kStripeApiKey = "";

  static LinearGradient BACKGROUND_GRADIAN = LinearGradient(colors: [
    Constants.COLOR_PRIMARY.withOpacity(0.4),
    Constants.COLOR_SECONDARY.withOpacity(0.4),
  ], begin: FractionalOffset.topCenter, end: FractionalOffset.bottomCenter);

  //colors
  static List<Color> kitGradients = [
    Colors.blueGrey.shade800,
    Colors.black87,
  ];

  static List<Color> kitGradients2 = [
    Colors.cyan.shade600,
    Colors.blue.shade900
  ];

  static List<Color> kitGradients3 = [
    Colors.purple.shade600,
    Colors.deepPurple.shade900
  ];

  static const List<Color> GRADIENT_CHOICES = [COLOR_PRIMARY, COLOR_SECONDARY];

  // Shared Prefs Tags
  static const String EVENT_MODEL = "EVENT_MODEL";
}
