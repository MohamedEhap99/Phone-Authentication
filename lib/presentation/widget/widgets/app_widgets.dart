import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_phone_auth/utils/constants.dart';

Widget button(BuildContext context, String label, Function()? onTap,
    {colors = const [
      Constants.COLOR_PRIMARY,
      Constants.COLOR_SECONDARY,
      Constants.COLOR_PRIMARY
    ]}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 54,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                color: Constants.COLOR_SECONDARY.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget buttonLite(BuildContext context, String label, Function() onTap,
    {colors, width}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 54,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: colors ??
                  const [
                    Color.fromARGB(130, 60, 00, 00),
                    Color.fromARGB(130, 40, 10, 10)
                  ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget bbutton(BuildContext context, String label, String img, Function() onTap,
    {subLabel}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        height: 108,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(
                  img,
                ).image,
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomLeft,
                opacity: 0.15),
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(130, 60, 00, 00),
              Color.fromARGB(130, 40, 10, 10)
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              if (subLabel != null)
                Text(
                  subLabel,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget bbbutton(
    BuildContext context, String label, String img, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Container(
        height: 108,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset(
                  img,
                ).image,
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomLeft,
                opacity: 0.15),
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(130, 60, 00, 00),
              Color.fromARGB(130, 40, 10, 10)
            ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget sbutton(
    BuildContext context, String label, IconData icon, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0x55003366),
                blurStyle: BlurStyle.outer,
                blurRadius: 12)
          ]),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.black,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget title(label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget subtitle(label) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
    child: Row(
      children: [
        Expanded(
            child: Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 18),
        )),
      ],
    ),
  );
}

Widget lbutton(
    BuildContext context, String label, IconData icon, Function() onTap,
    {iconWidget, bgcolor = Colors.white}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.width / 2.5,
      width: MediaQuery.of(context).size.width - 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bgcolor,
          boxShadow: const [
            BoxShadow(
                color: Color(0x55003366),
                blurStyle: BlurStyle.outer,
                blurRadius: 12)
          ]),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            iconWidget ??
                Icon(
                  icon,
                  size: 48,
                  color: Colors.black,
                ),
            const SizedBox(
              height: 8,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget textInput(String label, controller, Function(String) onChanged,
    {TextInputType inputType = TextInputType.text,
    bool isPassword = false,
    onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
    child: TextFormField(
      controller: controller,
      keyboardType: inputType,
      onChanged: onChanged,
      onTap: onTap,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white70, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white70, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white, style: BorderStyle.solid, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
  );
}




///////// SETTINGS //////////

Widget settingsTitle(label) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
    child: Text(
      label,
      style: const TextStyle(color: CupertinoColors.systemGrey, fontSize: 16),
      textAlign: TextAlign.start,
    ),
  );
}

Widget settingsItem(String lable, icon, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: CupertinoColors.systemGrey3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: CupertinoColors.systemGrey3,
            size: 28,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Text(
            lable,
            style: const TextStyle(
                color: CupertinoColors.systemGrey2, fontSize: 18),
          ))
        ],
      ),
    ),
  );
}

Widget settingsItemsGroup(
    List<String> lables, List<IconData> icons, List<Function()> onTapGroup) {
  List<Widget> widgets = [];

  for (int i = 0; i < lables.length; i++) {
    widgets.add(GestureDetector(
      onTap: onTapGroup[i],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icons[i],
              color: CupertinoColors.systemGrey3,
              size: 28,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
              lables[i],
              style: const TextStyle(
                  color: CupertinoColors.systemGrey2, fontSize: 18),
            ))
          ],
        ),
      ),
    ));
    if (i < lables.length - 1) {
      widgets.add(const Divider(
        color: CupertinoColors.systemGrey3,
      ));
    }
  }

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: CupertinoColors.systemGrey3),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: widgets,
    ),
  );
}
