import 'components/color_button.dart';
import 'components/theme_button.dart';
import 'constants.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
       super.key,
       required this.changeTheme,
       required this.changeColor,
       required this.color_selected,
   });

  ThemeMode theme_mode = ThemeMode.light;
  ColorSelection color_selected = ColorSelection.pink;
  final void Function(bool isLight) changeTheme;
  final void Function(int value) changeColor;
 
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.color_selected,
          )
        ],
      ),
      // todo: switch between pages
      body: Padding(
           padding: const EdgeInsets.all(16.0),
          child:  Text(
            'You Hungry?😋',
            style: Theme.of(context).textTheme.displayLarge,
          ),
      ),

    );
}
}
