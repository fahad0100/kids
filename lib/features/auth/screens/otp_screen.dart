import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Pinput(
          // defaultPinTheme: defaultPinTheme,
          // focusedPinTheme: focusedPinTheme,
          // submittedPinTheme: submittedPinTheme,
          validator: (s) {
            print(s);
          },
        ),
      ),
    );
  }
}
