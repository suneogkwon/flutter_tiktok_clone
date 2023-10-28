import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:flutter_tiktok_clone/features/onboarding/interests_screen.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';

class BirthdayScreen extends HookWidget {
  BirthdayScreen({super.key}) : _now = DateTime.now();

  final DateTime _now;
  late final DateTime _initialDate = DateTime(
    _now.year - 12,
    _now.month,
    _now.day,
  );

  void _onTapNext(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
      ),
    );
  }

  void _updateBirthDay(
    TextEditingController controller,
    ValueNotifier<DateTime> notifier, [
    DateTime? newDate,
  ]) {
    newDate ??= _initialDate;

    notifier.value = newDate;
    controller.text = newDate.toString().split(' ').first;
  }

  @override
  Widget build(BuildContext context) {
    final birthday = useState(_initialDate);
    final birthdayController = useTextEditingController(
      text: birthday.value.toString().split(' ').first,
    );

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text('Sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.$36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'When\'s your birthday',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.$24,
              ),
            ),
            Gaps.v8,
            const Text(
              'Your birthday won\'t be shown publicly',
              style: TextStyle(
                color: Colors.black54,
                fontSize: Sizes.$16,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: birthdayController,
              enabled: false,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
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
              isEnabled: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 300,
        color: Colors.white,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _initialDate,
          maximumDate: _initialDate,
          onDateTimeChanged: (DateTime value) => _updateBirthDay(
            birthdayController,
            birthday,
            value,
          ),
        ),
      ),
    );
  }
}
