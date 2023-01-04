import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:test_phone_auth/presentation/widget/widgets/progress.dart';
import 'package:test_phone_auth/provider/progress_indicator.dart';
import 'package:test_phone_auth/utils/constants.dart';


import '../../widget/widgets/app_widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Constants.COLOR_PRIMARY,
            ),
            child: Stack(
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
                forgotPassword(),
              ],
            ),
          ),
          ProgressDialog(),
        ],
      ),
    );
  }

  TextEditingController emailController = TextEditingController();

  Widget forgotPassword() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 54,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 36,
                  )),
              Expanded(child: Container()),
              const Text(
                "Forgot Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: Container()),
            ],
          ),
          const SizedBox(
            height: 54,
          ),
          textInput("Email", emailController, (value) {},
              inputType: TextInputType.emailAddress),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: button(context, "Submit", () async {
              // validation
              String? errorMsg;
              if (emailController.text.trim().isEmpty) {
                errorMsg = "Email address required.";
              }

              // if (errorMsg != null) {
              //   await showOkAlertDialog(context: context, title: errorMsg);
              //   return;
              // }

              ProgressProvider.of(context).dialog!.showProgress();

              try {
                // await PhoneAuthBlocProvider.of(context).forgotPassword(
                //     emailController.text.trim());

                await showOkAlertDialog(
                    context: context, title: "Change password email sent!");

                Navigator.of(context).pop();
              } catch (err) {
                await showOkAlertDialog(
                    context: context,
                    title: err.toString().split(']')[1].trim());
              } finally {
                ProgressProvider.of(context).dialog!.hideProgress();
              }
            }),
          ),
        ],
      ),
    );
  }
}
