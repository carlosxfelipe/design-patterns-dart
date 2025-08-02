import '../../utils/ansi_colors.dart';

abstract class Hamburger {
  void prepare();
}

abstract class Drink {
  void pour();
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
    print('Preparando hambúrguer de carne ${rgb24('bovina', 0x8B4513)}');
  }
}

class Water implements Drink {
  @override
  void pour() {
    print('Servindo ${blue('água')}');
  }
}

class Soda implements Drink {
  @override
  void pour() {
    print('Servindo ${rgb24('refrigerante', 0xFFA500)}');
  }
}

abstract class RestaurantFactory {
  Hamburger createHamburger();
  Drink createDrink();
}

class FastFoodRestaurantFactory implements RestaurantFactory {
  @override
  Hamburger createHamburger() => BeefHamburger();

  @override
  Drink createDrink() => Soda();
}

class HealthyRestaurantFactory implements RestaurantFactory {
  @override
  Hamburger createHamburger() => ChickenHamburger();

  @override
  Drink createDrink() => Water();
}

void main() {
  print(red('Fast Food Restaurant'));
  {
    final factory = FastFoodRestaurantFactory();
    factory.createHamburger().prepare();
    factory.createDrink().pour();
  }

  print(green('\nHealthy Restaurant'));
  {
    final factory = HealthyRestaurantFactory();
    factory.createHamburger().prepare();
    factory.createDrink().pour();
  }
}
