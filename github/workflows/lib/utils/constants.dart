import 'package:flutter/material.dart';

class AppConstants {
  // App Colors
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFF1976D2);
  static const Color accentColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFf44336);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color infoColor = Color(0xFF00BCD4);
  
  // App Strings
  static const String appName = 'Shiksha Setu';
  static const String appVersion = '1.0.0';
  
  // Classes
  static const List<String> classes = ['9', '10', '11', '12'];
  
  // Streams
  static const List<String> streams = ['Science', 'Arts', 'Commerce'];
  
  // Subjects
  static const Map<String, List<String>> subjects = {
    'Science': ['Physics', 'Chemistry', 'Biology', 'Mathematics', 'English'],
    'Arts': ['History', 'Geography', 'Political Science', 'Economics', 'English'],
    'Commerce': ['Accountancy', 'Economics', 'Business Studies', 'Mathematics', 'English'],
  };
  
  // Padding & Margin
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 12.0;
  static const double borderRadius = 12.0;
  
  // Font Sizes
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
}
