import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneFieldView extends StatelessWidget {
  final Key inputKey;
  final PhoneController controller;
  final CountrySelectorNavigator selectorNavigator;
  final bool withLabel;
  final bool outlineBorder;
  final bool shouldFormat;
  final bool required;
  final bool mobileOnly;
  final bool useRtl;

  const PhoneFieldView({
    Key? key,
    required this.inputKey,
    required this.controller,
    required this.selectorNavigator,
    required this.withLabel,
    required this.outlineBorder,
    required this.shouldFormat,
    required this.required,
    required this.mobileOnly,
    required this.useRtl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Directionality(
        textDirection: useRtl ? TextDirection.rtl : TextDirection.ltr,
        child: PhoneFormField(
          key: inputKey,
          controller: controller,
          shouldFormat: shouldFormat,
          autofocus: true,
          autofillHints: const [AutofillHints.telephoneNumber],
          countrySelectorNavigator: selectorNavigator,
          defaultCountry: IsoCode.EG,
          decoration: InputDecoration(
            // label: withLabel ? const Text('Phone') : null,
            border: outlineBorder
                ? const OutlineInputBorder()
                : const UnderlineInputBorder(),
            hintText: withLabel ? '' : 'Phone',
          ),
          enabled: true,

          showFlagInInput: true,
          validator: PhoneValidator.compose([
            // list of validators to use
            PhoneValidator.required(errorText: "You must enter a value"),
            PhoneValidator.validMobile(),
            // ..
          ]),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          cursorColor: Theme.of(context).colorScheme.primary,
          // ignore: avoid_print
          onSaved: (p) => print('saved $p'),
          // ignore: avoid_print
          onChanged: (p) => print('changed $p'),
        ),
      ),
    );
  }
}


