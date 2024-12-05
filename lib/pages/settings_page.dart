import 'package:flutter/material.dart';
import 'package:grocery_app/model/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('checking'),
          actions: [
            Switch(
                value: value.isDarkTheme,
                onChanged: (bool newValue) {
                  value.toggleTheme();
                })
          ],
        ),
      );
    });
  }
}
