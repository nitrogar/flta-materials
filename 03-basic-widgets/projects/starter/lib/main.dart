import 'package:flutter/material.dart';
import 'components/color_button.dart';
import 'components/theme_button.dart';
import 'constants.dart';
import 'home.dart';

void main() {
  // 1
  runApp(Yummy());
}

class Yummy extends StatefulWidget {
  // TODO: Setup default theme

  // 2
  Yummy({super.key});

  // TODO: Add changeTheme above here
  @override
  State<StatefulWidget> createState() => _YummyState();
}

class _YummyState extends State<Yummy> {

  // TODO: Setup default theme
  ThemeMode theme_mode = ThemeMode.light;
  ColorSelection color_selected = ColorSelection.pink;

  void changeThemeMode(bool useLightMode){
    setState(() {
        theme_mode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void changeColor(int value){
    setState(() {
        color_selected  = ColorSelection.values[value];
    });

  }
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Yummy title';
    //3
    return MaterialApp(
      title: appTitle,
      //debugShowCheckedModeBanner: false, // Uncomment to remove Debug banner

      // TODO: Add theme
      theme: ThemeData(
        colorSchemeSeed: color_selected.color,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: color_selected.color,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      themeMode: theme_mode,
      // TODO: Apply Home widget

      // 4
      home: Home(
        changeTheme: changeThemeMode,
        changeColor: changeColor,
        color_selected: color_selected
    )
  );
  }
}
