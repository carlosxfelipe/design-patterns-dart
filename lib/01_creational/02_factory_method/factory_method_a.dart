import 'dart:io';
import '../../utils/ansi_colors.dart';

abstract class Hamburger {
  void prepare();
}

class ChickenHamburger implements Hamburger {
  @override
  void prepare() {
    print('Preparando hambúrguer de ${yellow('frango')}');
  }
}

class BeefHamburger implements Hamburger {
  @override
  void prepare() {
    print('Preparando hambúrguer de carne ${rgb8('bovina', 94)}');
  }
}

class VeggieHamburger implements Hamburger {
  @override
  void prepare() {
    print('Preparando hambúrguer ${green('vegetariano')}');
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
    print(red(e.toString()));
  }
}
