import 'package:flutter/material.dart';
import 'package:savor_brew/core/app_styles.dart';
import 'package:savor_brew/core/widgets/custom_button.dart';
import 'package:savor_brew/core/widgets/custom_text_field.dart';
import 'package:savor_brew/views/auth/register/regis.dart';
import 'package:savor_brew/views/navigation_menu.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({
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
            Text('Welcome!', style: AppStyles.styleBold32(context)),
            Text('Please Login or Sign Up to start shopping',
                style: AppStyles.styleRegular18(context)
                    .copyWith(color: Colors.grey)),
            const SizedBox(height: 40),
            const LoginForm(),
            const SizedBox(height: 16),
            const Align(alignment: Alignment.center, child: Text('-OR-')),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, RegisterView.id);
              },
              text: 'Register',
            ),
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
              hintText: 'Enter Email',
              labelText: 'Email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              hintText: 'Enter Password',
              obscureText: _obscureText,
              labelText: 'Password',
              suffixIcon: IconButton(
                  onPressed: _toggle,
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  )),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text('Forgotten password?',
                    style: AppStyles.styleBold16(context)),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, NavigationMenu.id);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              text: 'LOGIN',
            ),
          ],
        ),
      ),
    );
  }
}
