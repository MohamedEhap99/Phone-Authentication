import 'package:flutter/material.dart';
import 'package:test_phone_auth/bloc/auth/phone_auth/phone_states.dart';
import 'package:test_phone_auth/presentation/pages/home/home_page.dart';
import 'package:test_phone_auth/presentation/widget/components/phone_auth_components.dart';
import 'package:test_phone_auth/provider/auth_bloc_provider.dart';
import 'package:test_phone_auth/provider/progress_indicator.dart';
import 'package:test_phone_auth/utils/constants.dart';

class OtpPage extends StatefulWidget {
  
  final String phoneNumber;
  const OtpPage({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
    final authbloc = AuthBlocProvider.of(context);
    authbloc.phone.listen((event) {
      if (event is LoadingState) {
        print('loading');
        ProgressProvider.of(context).dialog!.showProgress();
      } else if (event is ErrorOccurredState) {
        print('error fired');
        ProgressProvider.of(context).dialog!.hideProgress();
        String errorMsg = event.errorMsg.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMsg),
          backgroundColor: Constants.myBlack,
          duration: const Duration(seconds: 3),
        ));
      } else if (event is OTPVerified ) {
        //ProgressProvider.of(context).dialog!.hideProgress();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 88,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildIntroTextsOtp(widget.phoneNumber),
                const SizedBox(
                  height: 88,
                ),
                buildPinCodeFields(context),
                const SizedBox(
                  height: 60,
                ),
                buildVrifyButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}