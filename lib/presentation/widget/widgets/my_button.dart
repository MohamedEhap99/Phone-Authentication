import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onpressed;
  final Widget? child;
  final ButtonStyle? style;
  const CustomButton({
    super.key,
    required this.onpressed,
     required this.child,
     this.style,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
       style:style ,
       child:child,
      );
  }
}