import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends HookWidget {
  const PasswordScreen({super.key});

  bool _isPasswordPass(String password) {
    return password.isNotEmpty && password.length >= 8 && password.length <= 20;
  }

  void _onSubmit(
    BuildContext context,
    String password,
  ) {
    if (!_isPasswordPass(password)) return;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirthdayScreen(),
      ),
    );
  }

  void _onTapClear(TextEditingController controller) => controller.clear();

  void _onTapToggleObscure(ValueNotifier<bool> notifier) =>
      notifier.value = !notifier.value;

  @override
  Widget build(BuildContext context) {
    final passwordController = useTextEditingController();
    final password = useListenableSelector(
      passwordController,
      () => passwordController.text,
    );
    final isObscurePassword = useState(true);

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
              'Create password',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.$24,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: passwordController,
              autocorrect: false,
              obscureText: isObscurePassword.value,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onEditingComplete: () => _onSubmit(context, password),
              decoration: InputDecoration(
                suffix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => _onTapClear(passwordController),
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade500,
                        size: Sizes.$20,
                      ),
                    ),
                    Gaps.h16,
                    GestureDetector(
                      onTap: () => _onTapToggleObscure(isObscurePassword),
                      child: FaIcon(
                        isObscurePassword.value
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade500,
                        size: Sizes.$20,
                      ),
                    ),
                  ],
                ),
                hintText: 'Make it string!',
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
            Gaps.v10,
            Text(
              'Your password must have:',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            Gaps.v10,
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.circleCheck,
                  size: Sizes.$20,
                  color: _isPasswordPass(password)
                      ? Colors.green
                      : Colors.grey.shade400,
                ),
                Gaps.h5,
                Text('8 to 20 characters'),
              ],
            ),
            Gaps.v28,
            FormButton(
              isEnabled: _isPasswordPass(password),
              onTap: () => _onSubmit(context, password),
            ),
          ],
        ),
      ),
    );
  }
}
