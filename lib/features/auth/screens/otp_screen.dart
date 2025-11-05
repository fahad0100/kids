import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,

                    border: Border(
                      left: BorderSide(color: Colors.yellow, width: 10),
                      right: BorderSide(color: Colors.yellow, width: 10),
                      bottom: BorderSide(color: Colors.red, width: 10),
                      top: BorderSide(color: Colors.red, width: 10),
                    ),
                  ),
                ),

                onCompleted: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
