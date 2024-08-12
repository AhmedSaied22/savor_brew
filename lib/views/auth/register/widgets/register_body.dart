import 'package:flutter/material.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/core/widgets/custom_button.dart';
import 'package:savor_brew/core/widgets/custom_text_field.dart';
import 'package:savor_brew/views/auth/login/login_view.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const SizedBox(height: 60),
            Text('Register Now!', style: AppStyles.styleBold32(context)),
            Text('Create an new account',
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: Colors.grey)),
            const SizedBox(height: 40),
            const LoginForm(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final textFieldFocusNode = FocusNode();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Your Name',
              labelText: 'Name',
              controller: nameController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              hintText: 'Email',
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              hintText: 'Password',
              labelText: 'Password',
              obscureText: _obscureText,
              suffixIcon: IconButton(
                  onPressed: _toggle,
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                    color: Colors.brown,
                  )),
            ),
            const SizedBox(height: 48),
            CustomButton(
              onPressed: () {
                 if (formKey.currentState!.validate()) {
                Navigator.pushReplacementNamed(context, LoginView.id);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
