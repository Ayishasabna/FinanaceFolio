import 'package:flutter/material.dart';
import 'package:spendee/widgets/app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar('Privacy Policy', true, Icons.privacy_tip_outlined),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
              'We collect information about your activity in our services,which we used to do things like recommending a you tube video you might like.Terms you search for videos you watch.'),
        ),
      ),
    );
  }
}
