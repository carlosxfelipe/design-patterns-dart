import 'package:design_patterns_dart/utils/ansi_colors.dart';

class Player {
  final String name;
  final int score;
  final int level;

  const Player({
    required this.name,
    required this.score,
    required this.level,
  });

  Player copyWith({
    String? name,
    int? score,
    int? level,
  }) {
    return Player(
      name: name ?? this.name,
      score: score ?? this.score,
      level: level ?? this.level,
    );
  }

  void displayState() {
    print(bold(cyan('\nJogador: $name')));
    print(green('Pontos: $score'));
    print(yellow('Nível: $level'));
  }
}

void main() {
  var player = Player(
    name: 'Carlos',
    score: 0,
    level: 1,
  );

  print(blue('Estado inicial:'));
  player.displayState();

  player = player.copyWith(score: 10);
  print(blue('\nDepois de incrementar a pontuação:'));
  player.displayState();

  player = player.copyWith(level: 2);
  print(blue('\nDepois de subir de nível:'));
  player.displayState();

  player = player.copyWith(name: 'Carlos Pro');
  print(blue('\nDepois de mudar o nome:'));
  player.displayState();
}
