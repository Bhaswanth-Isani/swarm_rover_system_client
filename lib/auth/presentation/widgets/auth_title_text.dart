import 'package:flutter/material.dart';
import 'package:swarm_rover_system_client/theme/patrio_palette.dart';

class AuthTitleText extends StatelessWidget {
  const AuthTitleText({
    super.key,
    required this.topTitle,
    required this.mediumTitle,
    required this.bottomTitle,
  });

  final String topTitle;
  final String mediumTitle;
  final String bottomTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          topTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: PatrioPalette.linearGradient.colors,
            ).createShader(bounds);
          },
          child: Text(
            mediumTitle,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bottomTitle,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    );
  }
}
