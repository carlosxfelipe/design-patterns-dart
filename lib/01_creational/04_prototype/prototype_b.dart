class Pokemon {
  String name;
  String type;
  int level;
  List<String> attacks;

  Pokemon(this.name, this.type, this.level, List<String> attacks)
      : attacks = List.from(attacks);

  Pokemon clone() {
    return Pokemon(name, type, level, List.from(attacks));
  }

  void displayInfo() {
    print('Nome: $name');
    print('Tipo: $type');
    print('Nível: $level');
    print('Ataques: ${attacks.join(", ")}');
  }
}

void main() {
  final pikachu = Pokemon("Pikachu", "Elétrico", 5, [
    "Choque do Trovão",
    "Ataque Rápido",
  ]);

  final charmander = Pokemon("Charmander", "Fogo", 5, [
    "Lança-chamas",
    "Garra de Fogo",
  ]);

  final clonedPikachu = pikachu.clone();
  final clonedCharmander = charmander.clone();

  clonedPikachu.displayInfo();
  clonedCharmander.displayInfo();
}
