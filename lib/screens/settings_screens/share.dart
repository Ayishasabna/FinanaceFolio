import 'package:flutter/material.dart';
import 'package:spendee/widgets/app_bar.dart';

class share extends StatelessWidget {
  const share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Share', true, Icons.share),
    );
  }
}
