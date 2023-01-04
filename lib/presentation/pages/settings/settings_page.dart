import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:test_phone_auth/presentation/pages/settings/lang_page.dart';
import 'package:test_phone_auth/presentation/widget/widgets/app_widgets.dart';
import 'package:test_phone_auth/utils/app_icons.dart';
import 'package:test_phone_auth/utils/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                            size: 32,
                          )),
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.settings,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      )),
                      IconButton(
                          onPressed: () async {},
                          icon: const Icon(
                            CupertinoIcons.gift,
                            color: Colors.white,
                            size: 32,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                settingsTitle(AppLocalizations.of(context)!.plan),
                settingsItem(AppLocalizations.of(context)!.freemuim,
                    CupertinoIcons.money_dollar_circle, () {}),
                settingsTitle(AppLocalizations.of(context)!.account),
                settingsItemsGroup([
                  AppLocalizations.of(context)!.email,
                  AppLocalizations.of(context)!.password,
                  AppLocalizations.of(context)!.delete_acc,
                ], [
                  CupertinoIcons.mail,
                  CupertinoIcons.lock_shield,
                  CupertinoIcons.trash,
                ], [
                  () {},
                  () {},
                  () {},
                ]),
                settingsTitle(AppLocalizations.of(context)!.app_settings),
                settingsItemsGroup([
                  AppLocalizations.of(context)!.lang,
                  AppLocalizations.of(context)!.notifications,
                ], [
                  AppIcons.translate,
                  CupertinoIcons.bell_solid,
                ], [
                  () {
                    PersistentNavBarNavigator.pushDynamicScreen(
                      context,
                      screen: MaterialPageRoute(
                          builder: (context) => const LangPage()),
                      withNavBar: true,
                    );
                  },
                  () {},
                ]),
                settingsTitle(AppLocalizations.of(context)!.contacs),
                settingsItem(AppLocalizations.of(context)!.freemuim,
                    CupertinoIcons.arrow_2_circlepath, () {}),
                settingsTitle(AppLocalizations.of(context)!.others),
                settingsItemsGroup([
                  AppLocalizations.of(context)!.permissions,
                  AppLocalizations.of(context)!.contactus,
                  AppLocalizations.of(context)!.feedback,
                  AppLocalizations.of(context)!.review_on_store,
                ], [
                  CupertinoIcons.lock,
                  CupertinoIcons.text_bubble,
                  CupertinoIcons.exclamationmark_bubble_fill,
                  CupertinoIcons.star_fill,
                ], [
                  () {},
                  () {},
                  () {},
                  () {},
                ]),
                const SizedBox(height: 24,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
