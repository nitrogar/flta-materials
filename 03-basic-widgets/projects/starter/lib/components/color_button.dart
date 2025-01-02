import 'package:flutter/material.dart';
import '../constants.dart';

class ColorButton extends StatelessWidget {
  ColorButton({
    super.key,
    required this.changeColor,
    required this.colorSelected,
  });

  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: changeColor,
      icon: Icon(
        Icons.opacity_outlined,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return List.generate(ColorSelection.values.length, (index) {
          final currenColor = ColorSelection.values[index];
          return PopupMenuItem(
            value: index,
            enabled: currenColor != colorSelected,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.opacity_outlined,
                    color: currenColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currenColor.label),
                )
              ],
            ),
          );
        });
      },
    );
  }
}
