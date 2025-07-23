import 'package:design_patterns_dart/utils/print_with_color.dart';

class Document {
  String title;
  final String _content;
  String author;

  Document(this.title, String content, this.author) : _content = content;

  void displayInfo() {
    print('Title: $title');
    print('Author: $author');
    print('Content: $_content');
  }

  Document clone() {
    return Document(title, _content, author);
  }
}

void main() {
  final doc1 = Document(
    'O guia de Dart',
    'Fundamentos, prática, conceitos avançados e tudo mais',
    'Julio Bitencourt',
  );

  printWithColor('', 'doc1:', 'blue');
  doc1.displayInfo();

  final doc2 = doc1.clone();
  doc2.title = 'O guia avançado de Dart';

  printWithColor('\n', 'doc2:', 'green');
  doc2.displayInfo();
}
