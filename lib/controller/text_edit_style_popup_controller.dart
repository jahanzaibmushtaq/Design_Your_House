import 'package:flutter/material.dart';

class TextEditMenuController {
  TextEditingController textEditingController = TextEditingController();
  int selectedIndex = -1; // Initialize selectedIndex to -1 to indicate no selection
  Color selectedTextColor = Colors.black;
  FontWeight selectedFontWeight = FontWeight.normal;
  FontStyle selectedFontStyle = FontStyle.normal;
  double selectedFontSize = 20;
  TextAlign selectedTextAlign = TextAlign.left;

  List<PopupMenuItem<Function>> getMenuItems() {
    return [
      PopupMenuItem<Function>(
        value: () => changeTextColor(Colors.red),
        child: const Text('Red'),
      ),
      PopupMenuItem<Function>(
        value: () => changeTextColor(Colors.white),
        child: const Text('White'),
      ),
      PopupMenuItem<Function>(
        value: () => changeTextColor(Colors.black),
        child: const Text('Black'),
      ),
      // Add more colors as needed...
      PopupMenuItem<Function>(
        value: () => increaseFontSize(),
        child: const Text('Increase Font Size'),
      ),
      PopupMenuItem<Function>(
        value: () => decreaseFontSize(),
        child: const Text('Decrease Font Size'),
      ),
      PopupMenuItem<Function>(
        value: () => alignLeft(),
        child: const Text('Align Left'),
      ),
      PopupMenuItem<Function>(
        value: () => alignCenter(),
        child: const Text('Align Center'),
      ),
      PopupMenuItem<Function>(
        value: () => alignRight(),
        child: const Text('Align Right'),
      ),
      PopupMenuItem<Function>(
        value: () => boldText(),
        child: const Text('Bold'),
      ),
      PopupMenuItem<Function>(
        value: () => italicText(),
        child: const Text('Italic'),
      ),
      // Add more styling options as needed...
    ];
  }

  void onSelected(Function function) {
    function();
  }

  void onCanceled() {
    // Handle cancel event if needed.
  }

  void changeTextColor(Color color) {
    selectedTextColor = color;
  }

  void increaseFontSize() {
    selectedFontSize += 2;
  }

  void decreaseFontSize() {
    selectedFontSize -= 2;
  }

  void alignLeft() {
    selectedTextAlign = TextAlign.left;
  }

  void alignCenter() {
    selectedTextAlign = TextAlign.center;
  }

  void alignRight() {
    selectedTextAlign = TextAlign.right;
  }

  void boldText() {
    selectedFontWeight =
    selectedFontWeight == FontWeight.bold ? FontWeight.normal : FontWeight.bold;
  }

  void italicText() {
    selectedFontStyle =
    selectedFontStyle == FontStyle.italic ? FontStyle.normal : FontStyle.italic;
  }
}