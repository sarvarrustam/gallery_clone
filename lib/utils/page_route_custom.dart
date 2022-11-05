import 'package:flutter/cupertino.dart';

class AppPageRouter extends PageRouteBuilder {
  Widget? child;
  AppPageRouter({required this.child})
      : super(
            pageBuilder: (context, animtion, secondaryAnimation) => child!,
            transitionsBuilder:
                (context, animtion, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: animtion,
                      child: ScaleTransition(scale: animtion, child: child),
                    ),
            transitionDuration: const Duration(milliseconds: 500));
}
