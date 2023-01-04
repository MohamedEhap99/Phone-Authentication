import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:test_phone_auth/bloc/auth/phone_auth/phone_states.dart';
import 'package:test_phone_auth/presentation/pages/authentication/otp_page.dart';
import 'package:test_phone_auth/presentation/widget/components/phone_auth_components.dart';
import 'package:test_phone_auth/presentation/widget/widgets/my_button.dart';
import 'package:test_phone_auth/presentation/widget/widgets/my_progress_indicator.dart';
import 'package:test_phone_auth/presentation/widget/widgets/phone_field_view.dart';
import 'package:test_phone_auth/provider/auth_bloc_provider.dart';
import 'package:test_phone_auth/provider/progress_indicator.dart';
import 'package:test_phone_auth/utils/constants.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  late PhoneController controller;
  bool outlineBorder = true;
  bool mobileOnly = true;
  bool shouldFormat = false;
  bool required = false;
  bool withLabel = true;
  bool useRtl = false;
  CountrySelectorNavigator selectorNavigator =
      const CountrySelectorNavigator.searchDelegate();

  @override
  initState() {
    super.initState();
    controller = PhoneController(null);
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final phoneAuthBloc = AuthBlocProvider.of(context);
    phoneAuthBloc.phone.listen((event) {
      if (event is LoadingState) {
        debugPrint('Loadingggggggggg');
showProgressInicator(context);
        //ProgressProvider.of(context).dialog!.showProgress();
      } else if (event is ErrorOccurredState) {
        ProgressProvider.of(context).dialog!.hideProgress();
        String errorMsg = event.errorMsg.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMsg),
          backgroundColor: Constants.myBlack,
          duration: const Duration(seconds: 3),
        ));
      } else if (event is PhoneNumberSubmitedState) {
        //ProgressProvider.of(context).dialog!.hideProgress();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => OtpPage(
                phoneNumber:
                    '+${controller.value!.countryCode}${controller.value!.nsn}')));
      }
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  final phoneKey = GlobalKey<FormFieldState<PhoneNumber>>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: double.infinity),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SwitchListTile(
                        value: useRtl,
                        onChanged: (v) => setState(() => useRtl = v),
                        title: const Text('RTL'),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: formKey,
                        child: PhoneFieldView(
                          inputKey: phoneKey,
                          controller: controller,
                          selectorNavigator: selectorNavigator,
                          withLabel: withLabel,
                          outlineBorder: outlineBorder,
                          required: required,
                          mobileOnly: mobileOnly,
                          shouldFormat: shouldFormat,
                          useRtl: useRtl,
                        ),
                      ),
                      const SizedBox(height: 12),
                      CustomButton(
                        onpressed: () async {
                          if (formKey.currentState!.validate()) {
                            String tel =
                                "+${controller.value!.countryCode}${controller.value!.nsn}";
                            await register(context, tel);
                          }
                        },
                        child: const Text('Next'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
