import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_phone_auth/provider/progress_indicator.dart';


class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<bool>(
        stream: ProgressProvider.of(context).dialog?.show,
        builder: (context, snapshot) {
          return Visibility(
            visible: snapshot.data ?? false,
            child:  Container(
              color: Colors.black ,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            )
          );
        });
  }
}
