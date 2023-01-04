import 'package:flutter/material.dart';
import 'package:test_phone_auth/presentation/pages/authentication/phone_auth_page.dart';
import 'package:test_phone_auth/presentation/widget/widgets/my_button.dart';
import 'package:test_phone_auth/provider/auth_bloc_provider.dart';
import 'package:test_phone_auth/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = AuthBlocProvider.of(context);
    return Scaffold(
      // backgroundColor: Constants.COLOR_BG,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Constants.COLOR_SECONDARY,
                Constants.COLOR_PRIMARY
                // Constants.COLOR_PRIMARY.withOpacity(0.3)
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
                          onPressed: () {},
                          icon: const Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black,
                            size: 32,
                          )),
                      const Expanded(
                          child: Text(
                        "wafaa",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      )),
                      IconButton(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.power_settings_new,
                            color: Colors.black,
                            size: 32,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomButton(
                  onpressed: () async {
                    authbloc.signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const PhoneAuthPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(110, 50),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Constants.myWhite,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
