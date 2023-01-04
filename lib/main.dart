import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_phone_auth/bloc/auth/phone_auth/phone_auth_bloc.dart';
import 'package:test_phone_auth/bloc/lang/lang_bloc.dart';
import 'package:test_phone_auth/presentation/pages/authentication/phone_auth_page.dart';
import 'package:test_phone_auth/presentation/pages/index/index_page.dart';

import 'package:test_phone_auth/presentation/pages/onboarding/onboarding_page.dart';
import 'package:test_phone_auth/presentation/widget/widgets/progress.dart';
import 'package:test_phone_auth/provider/auth_bloc_provider.dart';
import 'package:test_phone_auth/provider/lang_bloc_provider.dart';
import 'package:test_phone_auth/provider/progress_indicator.dart';
import 'package:test_phone_auth/provider/store_bloc_provider.dart';
import 'package:test_phone_auth/utils/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Production code
  ErrorWidget.builder = (FlutterErrorDetails details) => Container();

 SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setInt("OPEN_COUNT", (prefs.getInt("OPEN_COUNT") ?? 0) + 1);

  bool firstOpen = (prefs.getInt("OPEN_COUNT") ?? 0) < 20;

  runApp(MyApp(
    firstOpen: firstOpen,
  ));
}

class MyApp extends StatelessWidget {
  final bool firstOpen;
  MyApp({
    Key? key,
    required this.firstOpen,
  }) : super(key: key);

  final _progressBloc = ProgressBloc();
  final _PhoneAuthBloc = PhoneAuthBloc();
  final _langBloc = LangBloc();

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('en', timeago.FrMessages());

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light));

    return ProgressProvider(
      dialog: _progressBloc,
    
       
        child: LangBlocProvider(
          bloc: _langBloc,
          child: AuthBlocProvider(
            bloc: _PhoneAuthBloc,
            child: StoreBlocProvider(
              store: Store(),
              child: StreamBuilder<String?>(
                  stream: _langBloc.local,
                  builder: (context, snapshot) {
                    return MaterialApp(
                      title: Constants.APP_NAME,
                      locale:
                          Locale.fromSubtags(languageCode: snapshot.data ?? 'en'),
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: const [
                        Locale('en', ''),
                        Locale('ar', ''),
                      ],
                      // theme: ThemeData.dark().copyWith(
                      //     // textTheme: GoogleFonts.comfortaaTextTheme(
                      //     //   Theme.of(context).textTheme,
                      //     // ),
                      //     cardColor: Colors.white,
                      //     backgroundColor: Colors.white,
                      //     dialogBackgroundColor: Colors.white,
                      //     brightness: Brightness.light,
                      //     sliderTheme: const SliderThemeData(
                      //       thumbColor: Colors.white,
                      //       overlayColor: Colors.white60,
                      //       activeTrackColor: Colors.white,
                      //     )),
                      debugShowCheckedModeBanner: false,
                      home: firstOpen ? const OnboardingPage() : buildRoot(context),
                    );
                  }),
            ),
          ),
        ),
    
  
  
  
    );
  }

  Widget buildRoot(BuildContext context) {
    return Stack(children: <Widget>[
      StreamBuilder(
          stream: _PhoneAuthBloc.user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data is User) {
                return const IndexPage();
              } else {
                return const PhoneAuthPage();
              }
            } else {
              return const PhoneAuthPage();
            }
          }),
      const ProgressDialog(),
    ]);
  }
}


