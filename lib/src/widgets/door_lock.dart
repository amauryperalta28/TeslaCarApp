import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla_car_app/src/assets.dart';
import 'package:tesla_car_app/src/constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.onTap,
    required this.isLocked,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool isLocked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: isLocked
            ? SvgPicture.asset(
                Assets.lockedDoor,
                key: ValueKey("doorLooked"),
              )
            : SvgPicture.asset(
                Assets.unlockedDoor,
                key: ValueKey("doorUnlooked"),
              ),
      ),
    );
  }
}