import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/email_screen.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';

class UsernameScreen extends HookWidget {
  const UsernameScreen({super.key});

  void _onTapNext(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final usernameController = useTextEditingController();
    final username = useListenableSelector(
      usernameController,
      () => usernameController.text,
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
              'Create username',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.$24,
              ),
            ),
            Gaps.v8,
            const Text(
              'You can always change this later.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: Sizes.$16,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
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
              onTap: () => _onTapNext(context),
              isEnabled: username.isNotEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
