import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/home/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstant.appTitle,
      theme: ThemeData(
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorConstant.themeColor,
        ),
        appBarTheme: AppBarTheme(color: ColorConstant.themeColor),
        bottomAppBarTheme: BottomAppBarTheme(
          color: ColorConstant.themeColor,
          shape: const CircularNotchedRectangle(),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(StringConstant.appTitle),
        ),
        body: const Center(child: HomeView()),
      ),
    );
  }
}
