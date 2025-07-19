import 'dart:io';
import '../../utils/print_with_color.dart';

abstract class Hamburger {
  void prepare();
}

class ChickenHamburger implements Hamburger {
  @override
  void prepare() {
    printWithColor('Preparando hambúrguer de frango', 'yellow');
  }
}

class BeefHamburger implements Hamburger {
  @override
  void prepare() {
    printWithColor('Preparando hambúrguer de carne bovina', 'brown');
  }
}

class VeggieHamburger implements Hamburger {
  @override
  void prepare() {
    printWithColor('Preparando hambúrguer vegetariano', 'green');
  }
}

abstract class HamburgerFactory {
  Hamburger _createHamburger(); // Simula `protected`

  void orderHamburger() {
    final hamburger = _createHamburger();
    hamburger.prepare();
  }
}

class ChickenHamburgerFactory extends HamburgerFactory {
  @override
  Hamburger _createHamburger() => ChickenHamburger();
}

class BeefHamburgerFactory extends HamburgerFactory {
  @override
  Hamburger _createHamburger() => BeefHamburger();
}

class VeggieHamburgerFactory extends HamburgerFactory {
  @override
  Hamburger _createHamburger() => VeggieHamburger();
}

HamburgerFactory getHamburgerFactoryByChoice(String choice) {
  switch (choice) {
    case '1':
      return ChickenHamburgerFactory();
    case '2':
      return BeefHamburgerFactory();
    case '3':
      return VeggieHamburgerFactory();
    default:
      throw Exception('Opção "$choice" inválida.');
  }
}

void main() {
  stdout.write('Escolha o tipo de hambúrguer:\n'
      '1 - Frango\n'
      '2 - Carne\n'
      '3 - Vegetariano\n'
      '> ');

  final burgerChoice = stdin.readLineSync()?.trim();

  if (burgerChoice == null || burgerChoice.isEmpty) {
    print('Operação cancelada.');
    return;
  }

  try {
    final factory = getHamburgerFactoryByChoice(burgerChoice);
    factory.orderHamburger();
  } catch (e) {
    printWithColor(e.toString(), 'red');
  }
}
