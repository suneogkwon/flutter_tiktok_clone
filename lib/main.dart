import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/sign_up_screen.dart';

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
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: Sizes.$16 + Sizes.$2,
            )),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFe9435A),
        ),
      ),
      home: const SignUpScreen(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
    );
  }
}
