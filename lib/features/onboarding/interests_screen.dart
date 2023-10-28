import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:flutter_tiktok_clone/features/onboarding/widgets/interest_button.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';

const interests = [
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
  "Comedy",
  "Entertainment",
  "Animals",
  "Food",
  "Beauty & Style",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Fitness & Health",
  "DIY & Life Hacks",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
];

class InterestScreen extends HookWidget {
  const InterestScreen({super.key});

  void _onTapNext(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final isShowAppBarText = useListenableSelector(
      scrollController,
      () {
        try {
          return scrollController.offset > 100;
        } catch (e) {
          return false;
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          duration: 300.ms,
          opacity: isShowAppBarText ? 1 : 0,
          child: Text('Choos your interest'),
        ),
      ),
      body: Scrollbar(
        controller: scrollController,
        interactive: true,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.$24) +
                EdgeInsets.only(bottom: Sizes.$16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.$40,
                  ),
                ),
                Gaps.v20,
                Text(
                  'Get better video recommendations',
                  style: TextStyle(
                    fontSize: Sizes.$20,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: Sizes.$16,
                  spacing: Sizes.$16,
                  children: [
                    for (final interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 124,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
          Sizes.$24,
          Sizes.$16,
          Sizes.$24,
          Sizes.$40,
        ),
        child: GestureDetector(
          onTap: () => _onTapNext(context),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.$16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
