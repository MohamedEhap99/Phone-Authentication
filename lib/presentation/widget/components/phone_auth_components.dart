import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_phone_auth/presentation/widget/widgets/my_button.dart';
import 'package:test_phone_auth/provider/auth_bloc_provider.dart';
import 'package:test_phone_auth/utils/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

// Widget buildNextButton() => Align(
//       alignment: Alignment.centerRight,
//       child: CustomButton(
//         onpressed: () {

//         },
//         style: ElevatedButton.styleFrom(
//           minimumSize: const Size(110, 50),
//           backgroundColor: Colors.black,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         ),
//         child: const Text(
//           'Next',
//           style: TextStyle(
//             color: Constants.myWhite,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );

late String verificationId;
Future<void> register(BuildContext context, String phoneNumber) async {
  final authBloc = AuthBlocProvider.of(context);
 await authBloc.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: authBloc.verificationCompleted,
      verificationFailed: authBloc.verificationFailed,
      codeSent: authBloc.codeSent,
      codeAutoRetrievalTimeout: authBloc.codeAutoRetrievalTimeout);
}

/// OTP SCREEN

Widget buildIntroTextsOtp(phoneNumber) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Varify your phone number',
          style: TextStyle(
            color: Constants.myBlack,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter your 6 digit code numbers sent to',
              style: const TextStyle(
                  color: Constants.myBlack, fontSize: 18, height: 1.4),
              children: [
                TextSpan(
                  text: '$phoneNumber',
                  style: const TextStyle(
                    color: Constants.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

late String otpCode;
Widget buildPinCodeFields(
  BuildContext context,
) {
  return SizedBox(
    child: PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: Constants.myBlack,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: Constants.blue,
        inactiveColor: Constants.blue,
        activeFillColor: Constants.lightBlue,
        inactiveFillColor: Constants.myWhite,
        selectedColor: Constants.blue,
        selectedFillColor: Constants.myWhite,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Constants.myWhite,
      enableActiveFill: true,
      onCompleted: (submittedCode) {
        otpCode = submittedCode;
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
    ),
  );
}

Widget buildVrifyButton(BuildContext context) => Align(
      alignment: Alignment.centerRight,
      child: CustomButton(
        onpressed: () {
          login(context);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: const Text(
          'Verify',
          style: TextStyle(
            color: Constants.myWhite,
            fontSize: 16,
          ),
        ),
      ),
    );

void login(BuildContext context) {
  final authBloc = AuthBlocProvider.of(context);
  authBloc.submitOTP(otpCode);
}
