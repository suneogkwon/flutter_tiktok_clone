import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/widgets/gaps.dart';

class TutorialScreen extends HookWidget {
  const TutorialScreen({super.key});

  void _onPanUpdate(
    DragUpdateDetails details,
    ValueNotifier<AxisDirection> direction,
  ) {
    if (details.delta.dx > 0) {
      direction.value = AxisDirection.left;
    } else {
      direction.value = AxisDirection.right;
    }
  }

  void _onPanEnd(
    DragEndDetails details,
    AxisDirection direction,
    ValueNotifier<CrossFadeState> page,
  ) {
    switch (direction) {
      case AxisDirection.right:
        page.value = CrossFadeState.showSecond;
      case AxisDirection.left:
        page.value = CrossFadeState.showFirst;
      default:
        page.value = CrossFadeState.showFirst;
    }
  }

  @override
  Widget build(BuildContext context) {
    final direction = useState(AxisDirection.right);
    final page = useState(CrossFadeState.showFirst);

    return GestureDetector(
      onPanUpdate: (details) => _onPanUpdate(
        details,
        direction,
      ),
      onPanEnd: (details) => _onPanEnd(
        details,
        direction.value,
        page,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.$24,
          ),
          child: SafeArea(
            child: AnimatedCrossFade(
              duration: 300.ms,
              crossFadeState: page.value,
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Watch cool videos!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.$40,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.$20,
                    ),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v80,
                  Text(
                    'Follow the rules!',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.$40,
                    ),
                  ),
                  Gaps.v16,
                  Text(
                    'Videos are personalized for you based on what you watch, like, and share.',
                    style: TextStyle(
                      fontSize: Sizes.$20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.$24,
            vertical: Sizes.$12,
          ),
          child: AnimatedOpacity(
            duration: 300.ms,
            opacity: page.value != CrossFadeState.showSecond ? 0 : 1,
            child: CupertinoButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.primary,
              child: Text('Enter the app!'),
            ),
          ),
        ),
      ),
    );
  }
}
