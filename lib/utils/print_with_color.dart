import 'ansi_colors.dart';

void printWithColor(String message, String color) {
  final colorMap = {
    'brown': AnsiColors.brown,
    'red': AnsiColors.red,
    'green': AnsiColors.green,
    'blue': AnsiColors.blue,
    'yellow': AnsiColors.yellow,
    'purple': AnsiColors.purple,
    'cyan': AnsiColors.cyan,
    'white': AnsiColors.white,
    'black': AnsiColors.black,
    'gray': AnsiColors.gray,
    'orange': AnsiColors.orange,
    'pink': AnsiColors.pink,
    'violet': AnsiColors.violet,
  };

  final ansi = colorMap[color.toLowerCase()] ?? AnsiColors.reset;
  print('$ansi$message${AnsiColors.reset}');
}
