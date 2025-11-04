import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:kinder_app/core/routes/base_route.dart';
import 'package:kinder_app/features/auth/bloc/auth_bloc.dart';
import 'package:kinder_app/features/widgets/fields/custon_field_widget.dart';
import 'package:string_validator/string_validator.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController(
      text: 'd@gmail.com',
    );
    final TextEditingController phoneController = TextEditingController();
    final bloc = context.read<AuthBloc>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is SuccessSignUpState) {
          LoadingWidget.close(context: context);
          context.push(Routes.otpScreen, extra: bloc);
        }
        if (state is LoadingState) {
          // Loading.show();

          LoadingWidget.show(context: context);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                CustomField(
                  label: 'Full name',
                  controller: fullNameController,
                  prefixIcon: Icons.person,
                  hint: 'Full name',
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      return "The name is required";
                    }
                    if (p0.isAlpha == false) {
                      return "The name is not valid";
                    }

                    return null;
                  },
                ),
                Gap(10),
                CustomField(
                  label: 'Email',
                  hint: 'Email',
                  keyboardType: TextInputType.number,
                  controller: emailController,
                  enable: true,
                  borderColor: Colors.red,
                  prefixIcon: Icons.email,
                  validator: (p0) {
                    if (p0 == null) {
                      return "The email is required";
                    }
                    if (p0.isEmail == false) {
                      return "The email is not valid";
                    }

                    return null;
                  },
                ),
                Gap(10),
                CustomField(
                  prefixIcon: Icons.phone,
                  controller: phoneController,
                  label: 'phone',
                  hint: 'Phone number',
                  enable: true,
                  validator: (p0) {
                    if (p0?.isNumeric == false) {
                      return "The phone is not valid";
                    }
                    if (p0?.startsWith('05') == false) {
                      return "The phone is not valid";
                    }
                    return null;
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isNotEmpty) {
                      bloc.add(SignUpEvent(email: emailController.text));
                    }
                  },
                  child: Text("data"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
email
full_name
phone


*/

class LoadingWidget {
  static final _key = GlobalKey();
  static void close({required BuildContext context}) {
    if (_key.currentContext?.mounted == true) {
      context.pop();
    }
  }

  static void show({required BuildContext context, String? message}) {
    showDialog(
      context: context,

      barrierDismissible: false, // يمنع الإغلاق عند الضغط خارج النافذة
      barrierColor: Colors.transparent,

      builder: (context) {
        return Dialog(
          key: _key,
          backgroundColor: Colors.blueGrey.withAlpha(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Spinner
                SizedBox(
                  height: 60,
                  width: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 20,

                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                const SizedBox(height: 24),

                // Optional message
                Text(
                  message ?? 'جاري التحميل...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
