import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/password_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';

class EmailScreen extends HookWidget {
  const EmailScreen({super.key});

  String? _validateEmail(String email) {
    if (email.isEmpty) return null;

    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regExp.hasMatch(email)) {
      return 'Email not valid';
    }

    return null;
  }

  void _onSubmit(
    BuildContext context,
    String email,
  ) {
    if (email.isEmpty || _validateEmail(email) != null) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final email = useListenableSelector(
      emailController,
      () => emailController.text,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.$36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'What is your email',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.$24,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: emailController,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: () => _onSubmit(context, email),
              decoration: InputDecoration(
                hintText: 'Email',
                errorText: _validateEmail(email),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            Gaps.v28,
            FormButton(
              isEnabled: email.isNotEmpty && _validateEmail(email) == null,
              onTap: () => _onSubmit(context, email),
            ),
          ],
        ),
      ),
    );
  }
}
