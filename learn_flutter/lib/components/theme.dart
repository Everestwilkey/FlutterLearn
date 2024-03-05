import 'package:flutter/material.dart';

class ForestTheme {
  static ThemeData get theme {
    return ThemeData(
      // Define a color scheme for the theme
      colorScheme: ColorScheme(
        primary: Color(0xFF4B9F5C), // Primary color inspired by forest greenery
        onPrimary: Colors.white, // Text/icon color on primary color
        secondary: Color(
            0xFFC6E377), // Used for the accent color, inspired by sunlight filtering through leaves
        onSecondary: Colors.black, // Text/icon color on secondary color
        error: Colors.red, // Default red for errors
        onError: Colors.white, // Text/icon color on error color
        background: Color(0xFFEFEFEF), // Light grey for background
        onBackground: Colors.black, // Text/icon color on background color
        surface: Colors.white, // Surface color
        onSurface: Colors.black, // Text/icon color on surface color
        brightness: Brightness.light, // Overall theme brightness
      ),
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Color(
            0xFF4B9F5C), // Use the primary color for the app bar background
        foregroundColor:
            Colors.white, // Use white for icons and text in the app bar
      ),
      // Button theme with the secondary color
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFFC6E377), // Use the secondary color for buttons
        textTheme: ButtonTextTheme.primary,
      ),
      // Text theme that uses earthy colors
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF355D3B)),
        bodyText1: TextStyle(fontSize: 14.0, color: Color(0xFF355D3B)),
      ),
      // Input decoration theme for text fields
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xFF4B9F5C)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xFF4B9F5C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Color(0xFFC6E377)),
        ),
      ),
      // Card theme for elevated elements
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Color(0xFF355D3B).withOpacity(0.2),
        elevation: 5,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // Other theme settings...
    );
  }
}
