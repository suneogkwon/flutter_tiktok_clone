import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/login_form_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onTapSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpScreen(),
      ),
    );
  }

  void _onTapEmail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.$40,
          ),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                'Log in to TikTok',
                style: TextStyle(
                  fontSize: Sizes.$24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v20,
              Text(
                'Manage your account, check notifications, comment on videos, and more.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: Sizes.$16,
                ),
              ),
              Gaps.v40,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.user),
                label: 'Use email & password',
                onTap: () => _onTapEmail(context),
              ),
              Gaps.v16,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.apple),
                label: 'Continue with Apple',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.$32 * 2 + Sizes.$20,
        color: Colors.grey.shade50,
        surfaceTintColor: Colors.transparent,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dont\'t have an account?'),
            Gaps.h5,
            GestureDetector(
              onTap: () => onTapSignUp(context),
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
