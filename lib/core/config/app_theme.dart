import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      textTheme: GoogleFonts.notoSansTextTheme(),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.purple),
        ),
      ),
    );
  }

// static ThemeData getLightTheme() => FlexThemeData.light(
//       scheme: FlexScheme.espresso,
//       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
//       blendLevel: 20,
//       appBarOpacity: 0.95,
//       tabBarStyle: FlexTabBarStyle.forBackground,
//       swapColors: true,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 20,
//         blendOnColors: false,
//         inputDecoratorRadius: 6.0,
//         bottomNavigationBarElevation: 23.0,
//       ),
//       visualDensity: FlexColorScheme.comfortablePlatformDensity,
//       useMaterial3: true,
//       textTheme: GoogleFonts.notoSansTextTheme(),
//     );

// static ThemeData getDarkTheme() => FlexThemeData.dark(
//       scheme: FlexScheme.espresso,
//       surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
//       blendLevel: 15,
//       appBarStyle: FlexAppBarStyle.background,
//       appBarOpacity: 0.90,
//       tabBarStyle: FlexTabBarStyle.forBackground,
//       subThemesData: const FlexSubThemesData(
//         blendOnLevel: 30,
//         inputDecoratorRadius: 6.0,
//         bottomNavigationBarElevation: 23.0,
//       ),
//       visualDensity: FlexColorScheme.comfortablePlatformDensity,
//       useMaterial3: true,
//       textTheme: GoogleFonts.notoSansTextTheme(),
//     );
}
