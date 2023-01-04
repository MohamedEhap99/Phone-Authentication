import 'package:flutter/material.dart';
import 'package:test_phone_auth/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

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

                          },
                          icon: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.white,
                            size: 32,
                          )),
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context)!.contacts,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      )),
                      IconButton(
                          onPressed: () async {

                          },
                          icon: const Icon(
                            Icons.power_settings_new,
                            color: Colors.white,
                            size: 32,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ],
            ),
          ),
        ],
      ),
    );
  }


}
