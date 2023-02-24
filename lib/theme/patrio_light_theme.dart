import 'package:flutter/material.dart';
import 'package:swarm_rover_system_client/core/presentation/helpers/running_platform.dart';
import 'package:swarm_rover_system_client/theme/patrio_palette.dart';
import 'package:swarm_rover_system_client/theme/patrio_text_theme.dart';

class PatrioLightTheme {
  static const scaffoldBackgroundColor = Color(0xfff4f6f8);
  static const sidebarColor = Color(0xffffffff);
  static const dividerColor = Color(0xff9ea5b6);
  static const inactiveColor = Color(0xffb2b2b2);
  static const activeColor = Color(0xff10123d);
  static const activeBackgroundColor = Color(0xffd7d5d3);
  static const textPrimaryColor = Color(0xff000000);
  static const textSecondaryColor = Color(0xff666666);

  final _patrioTextThemeLarge = PatrioTextThemeLarge();

  final _patrioTextThemeSmall = PatrioTextThemeSmall();

  ThemeData theme() => ThemeData(
        primaryColor: PatrioPalette.primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        brightness: Brightness.light,
        dialogBackgroundColor: sidebarColor,
        dividerColor: dividerColor,
        colorScheme: const ColorScheme(
          error: PatrioPalette.redColor,
          brightness: Brightness.light,
          primary: PatrioPalette.primaryColor,
          onPrimary: scaffoldBackgroundColor,
          onError: scaffoldBackgroundColor,
          background: scaffoldBackgroundColor,
          onBackground: textPrimaryColor,
          secondary: activeBackgroundColor,
          onSecondary: textSecondaryColor,
          surface: PatrioPalette.primaryColor,
          onSurface: textPrimaryColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: PatrioPalette.redColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: dividerColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: dividerColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: PatrioPalette.primaryColor.withOpacity(0.8),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: dividerColor, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
          hintStyle: RunningPlatform.isDesktop
              ? _patrioTextThemeLarge.inputTextField
                  .copyWith(color: dividerColor)
              : _patrioTextThemeSmall.inputTextField
                  .copyWith(color: dividerColor),
          labelStyle: RunningPlatform.isDesktop
              ? _patrioTextThemeLarge.inputTextField
                  .copyWith(color: dividerColor)
              : _patrioTextThemeSmall.inputTextField
                  .copyWith(color: dividerColor),
          contentPadding: const EdgeInsets.all(20),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) => RunningPlatform.isDesktop
                  ? _patrioTextThemeLarge.bodyMedium
                  : _patrioTextThemeSmall.bodyMedium,
            ),
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.resolveWith(
              (states) => EdgeInsets.zero,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.resolveWith(
              (states) => RunningPlatform.isDesktop
                  ? _patrioTextThemeLarge.titleSmall
                  : _patrioTextThemeSmall.titleSmall,
            ),
            shadowColor: MaterialStateProperty.resolveWith(
              (states) => PatrioPalette.primaryColor.withOpacity(0.8),
            ),
            elevation: MaterialStateProperty.resolveWith((states) => 8),
          ),
        ),
        textTheme: RunningPlatform.isDesktop
            ? TextTheme(
                displayLarge: _patrioTextThemeLarge.displayLarge,
                displayMedium: _patrioTextThemeLarge.displayMedium,
                displaySmall: _patrioTextThemeLarge.displaySmall,
                titleLarge: _patrioTextThemeLarge.titleLarge,
                titleMedium: _patrioTextThemeLarge.titleMedium,
                titleSmall: _patrioTextThemeLarge.titleSmall,
                bodyLarge: _patrioTextThemeLarge.bodyLarge,
                bodyMedium: _patrioTextThemeLarge.bodyMedium,
                bodySmall: _patrioTextThemeLarge.bodySmall,
                labelLarge: _patrioTextThemeLarge.inputTextField,
                labelMedium: _patrioTextThemeLarge.labelMedium,
                labelSmall: _patrioTextThemeLarge.labelSmall,
              )
            : TextTheme(
                displayLarge: _patrioTextThemeSmall.displayLarge,
                displayMedium: _patrioTextThemeSmall.displayMedium,
                displaySmall: _patrioTextThemeSmall.displaySmall,
                titleLarge: _patrioTextThemeSmall.titleLarge,
                titleMedium: _patrioTextThemeSmall.titleMedium,
                titleSmall: _patrioTextThemeSmall.titleSmall,
                bodyLarge: _patrioTextThemeSmall.bodyLarge,
                bodyMedium: _patrioTextThemeSmall.bodyMedium,
                bodySmall: _patrioTextThemeSmall.bodySmall,
                labelLarge: _patrioTextThemeSmall.inputTextField,
                labelMedium: _patrioTextThemeSmall.labelMedium,
                labelSmall: _patrioTextThemeSmall.labelSmall,
              ),
        disabledColor: inactiveColor,
        snackBarTheme: SnackBarThemeData(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      );
}
