import 'package:design_patterns_dart/utils/ansi_colors.dart';

class CodeEditorState {
  final String content;
  final int cursorPosition;
  final bool unsavedChanges;

  const CodeEditorState({
    required this.content,
    required this.cursorPosition,
    required this.unsavedChanges,
  });

  CodeEditorState copyWith({
    String? content,
    int? cursorPosition,
    bool? unsavedChanges,
  }) {
    return CodeEditorState(
      content: content ?? this.content,
      cursorPosition: cursorPosition ?? this.cursorPosition,
      unsavedChanges: unsavedChanges ?? this.unsavedChanges,
    );
  }

  String displayState() {
    final statusColor = unsavedChanges ? red : green;
    return 'Content: ${cyan(content)}, Cursor Position: ${yellow(cursorPosition.toString())}, '
        'Unsaved Changes: ${statusColor(unsavedChanges.toString())}';
  }
}

class CodeEditorHistory {
  final List<CodeEditorState> _history = [];
  int _currentIndex = -1;

  void save(CodeEditorState state) {
    if (_currentIndex < _history.length - 1) {
      _history.removeRange(_currentIndex + 1, _history.length);
    }

    _history.add(state);
    _currentIndex++;
  }

  CodeEditorState? undo() {
    if (_currentIndex > 0) {
      _currentIndex--;
      return _history[_currentIndex];
    }
    return null;
  }

  CodeEditorState? redo() {
    if (_currentIndex < _history.length - 1) {
      _currentIndex++;
      return _history[_currentIndex];
    }
    return null;
  }
}

void main() {
  final history = CodeEditorHistory();

  var currentState = CodeEditorState(
    content: "console.log('Hello, world!')",
    cursorPosition: 2,
    unsavedChanges: false,
  );
  history.save(currentState);

  print(bold(green('Estado inicial:')));
  print(currentState.displayState());

  currentState = currentState.copyWith(
    content: "console.log('Olá, mundo!') // Edição",
    cursorPosition: 5,
    unsavedChanges: true,
  );
  history.save(currentState);

  print(bold(green('Estado após edição:')));
  print(currentState.displayState());

  currentState = currentState.copyWith(
    cursorPosition: 10,
    unsavedChanges: true,
  );
  history.save(currentState);

  print(bold(green('Estado após nova edição:')));
  print(currentState.displayState());

  currentState = history.undo()!;
  print(bold(green('Estado após desfazer:')));
  print(currentState.displayState());

  currentState = history.redo()!;
  print(bold(green('Estado após refazer:')));
  print(currentState.displayState());
}
