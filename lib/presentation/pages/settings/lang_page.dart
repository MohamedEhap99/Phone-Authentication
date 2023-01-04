import 'package:flutter/material.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:test_phone_auth/presentation/widget/widgets/app_widgets.dart';
import 'package:test_phone_auth/provider/lang_bloc_provider.dart';
import 'package:test_phone_auth/utils/app_icons.dart';
import 'package:test_phone_auth/utils/constants.dart';


class LangPage extends StatefulWidget {
  const LangPage({Key? key}) : super(key: key);

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.COLOR_BG,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Constants.COLOR_SECONDARY,
                Constants.COLOR_PRIMARY.withOpacity(0.3)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 32,
                          )),
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.choose_lang,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      )),
                      const SizedBox(
                        width: 32,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                settingsTitle(AppLocalizations.of(context)!.choose_lang),
                settingsItemsGroup([
                  AppLocalizations.of(context)!.arabic,
                  AppLocalizations.of(context)!.english,
                ], [
                  AppIcons.translate,
                  AppIcons.translate,
                ], [
                  () {
                    LangBlocProvider.of(context).setLocal('ar');
                  },
                  () {
                    LangBlocProvider.of(context).setLocal('en');
                  },
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
