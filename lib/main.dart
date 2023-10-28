import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/onboarding/interests_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTok',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
            scrolledUnderElevation: 0,
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.$16 + Sizes.$2,
            )),
        bottomAppBarTheme: Theme.of(context).bottomAppBarTheme.copyWith(
              surfaceTintColor: Colors.transparent,
              color: Colors.grey.shade50,
              elevation: 0,
              padding: EdgeInsets.zero,
            ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFe9435A),
        ),
      ),
      // home: const SignUpScreen(),
      home: const InterestScreen(),

      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}
