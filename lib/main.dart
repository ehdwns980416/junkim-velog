import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/colors.dart';
import 'package:junkim_velog/constants/sizes.dart';
import 'package:junkim_velog/screens/practice_page_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JunKim Velog',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.baseColor,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: AppColors.baseColor,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size18,
            fontWeight: FontWeight.normal,
          ),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size15,
            fontWeight: FontWeight.normal,
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
          ),
          floatingLabelStyle: const TextStyle(
            color: AppColors.primaryColor,
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
      home: const PracticePageListScreen(),
    );
  }
}
