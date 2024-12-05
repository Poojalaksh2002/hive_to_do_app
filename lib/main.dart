import 'package:flutter/material.dart';
import 'package:grocery_app/model/grocery_model.dart';
import 'package:grocery_app/pages/intro_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'model/theme_provider.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Map<dynamic, dynamic>>('CartBoxLocal');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GroceryModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: Consumer<ThemeProvider>(builder: (context, value, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: value.currentTheme,
          debugShowCheckedModeBanner: false,
          home: IntroPage(),
        );
      }),
    );
  }
}
