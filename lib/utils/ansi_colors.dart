import 'dart:io';

/// Utilitário para colorir strings com códigos ANSI.
/// Inspirado por chalk, kleur e colors (npm).

class AnsiCode {
  final String open;
  final String close;
  final RegExp regexp;

  AnsiCode(List<int> openCodes, int closeCode)
      : open = '\x1b[${openCodes.join(";")}m',
        close = '\x1b[${closeCode}m',
        regexp = RegExp('\x1b\\[${closeCode}m');
}

class Rgb {
  final int r, g, b;

  Rgb(this.r, this.g, this.b);
}

bool _enabled = !Platform.environment.containsKey('NO_COLOR');

void setColorEnabled(bool value) {
  if (Platform.environment.containsKey('NO_COLOR')) return;
  _enabled = value;
}

bool getColorEnabled() => _enabled;

String _run(String text, AnsiCode code) {
  return _enabled
      ? '${code.open}${text.replaceAll(code.regexp, code.open)}${code.close}'
      : text;
}

String _color(String text, List<int> openCodes, int closeCode) =>
    _run(text, AnsiCode(openCodes, closeCode));

String reset(String text) => _color(text, [0], 0);
String bold(String text) => _color(text, [1], 22);
String dim(String text) => _color(text, [2], 22);
String italic(String text) => _color(text, [3], 23);
String underline(String text) => _color(text, [4], 24);
String inverse(String text) => _color(text, [7], 27);
String hidden(String text) => _color(text, [8], 28);
String strikethrough(String text) => _color(text, [9], 29);

String black(String text) => _color(text, [30], 39);
String red(String text) => _color(text, [31], 39);
String green(String text) => _color(text, [32], 39);
String yellow(String text) => _color(text, [33], 39);
String blue(String text) => _color(text, [34], 39);
String magenta(String text) => _color(text, [35], 39);
String cyan(String text) => _color(text, [36], 39);
String white(String text) => _color(text, [37], 39);
String gray(String text) => brightBlack(text);
String brightBlack(String text) => _color(text, [90], 39);
String brightRed(String text) => _color(text, [91], 39);
String brightGreen(String text) => _color(text, [92], 39);
String brightYellow(String text) => _color(text, [93], 39);
String brightBlue(String text) => _color(text, [94], 39);
String brightMagenta(String text) => _color(text, [95], 39);
String brightCyan(String text) => _color(text, [96], 39);
String brightWhite(String text) => _color(text, [97], 39);

String bgBlack(String text) => _color(text, [40], 49);
String bgRed(String text) => _color(text, [41], 49);
String bgGreen(String text) => _color(text, [42], 49);
String bgYellow(String text) => _color(text, [43], 49);
String bgBlue(String text) => _color(text, [44], 49);
String bgMagenta(String text) => _color(text, [45], 49);
String bgCyan(String text) => _color(text, [46], 49);
String bgWhite(String text) => _color(text, [47], 49);
String bgBrightBlack(String text) => _color(text, [100], 49);
String bgBrightRed(String text) => _color(text, [101], 49);
String bgBrightGreen(String text) => _color(text, [102], 49);
String bgBrightYellow(String text) => _color(text, [103], 49);
String bgBrightBlue(String text) => _color(text, [104], 49);
String bgBrightMagenta(String text) => _color(text, [105], 49);
String bgBrightCyan(String text) => _color(text, [106], 49);
String bgBrightWhite(String text) => _color(text, [107], 49);

int _clamp(int n, [int min = 0, int max = 255]) => n.clamp(min, max).toInt();

String rgb8(String text, int color) => _color(text, [38, 5, _clamp(color)], 39);

String bgRgb8(String text, int color) =>
    _color(text, [48, 5, _clamp(color)], 49);

String rgb24(String text, dynamic color) {
  int r, g, b;
  if (color is int) {
    r = (color >> 16) & 0xff;
    g = (color >> 8) & 0xff;
    b = color & 0xff;
  } else if (color is Rgb) {
    r = _clamp(color.r);
    g = _clamp(color.g);
    b = _clamp(color.b);
  } else {
    throw ArgumentError('Invalid color type');
  }
  return _color(text, [38, 2, r, g, b], 39);
}

String bgRgb24(String text, dynamic color) {
  int r, g, b;
  if (color is int) {
    r = (color >> 16) & 0xff;
    g = (color >> 8) & 0xff;
    b = color & 0xff;
  } else if (color is Rgb) {
    r = _clamp(color.r);
    g = _clamp(color.g);
    b = _clamp(color.b);
  } else {
    throw ArgumentError('Invalid color type');
  }
  return _color(text, [48, 2, r, g, b], 49);
}

final RegExp _ansiPattern = RegExp(
  r'[\u001B\u009B][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><~]',
);

String stripAnsiCode(String text) => text.replaceAll(_ansiPattern, '');
