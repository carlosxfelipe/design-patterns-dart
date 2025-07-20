import '../../utils/print_with_color.dart';

abstract class Hamburger {
  void prepare();
}

abstract class Drink {
  void pour();
}

class ChickenHamburger implements Hamburger {
  @override
  void prepare() {
    printWithColor('Preparando hambúrguer de ', 'frango', 'yellow');
  }
}

class BeefHamburger implements Hamburger {
  @override
  void prepare() {
    printWithColor('Preparando hambúrguer de carne ', 'bovina', 'brown');
  }
}

class Water implements Drink {
  @override
  void pour() {
    printWithColor('Servindo ', 'água', 'blue');
  }
}

class Soda implements Drink {
  @override
  void pour() {
    printWithColor('Servindo ', 'refrigerante', 'orange');
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

void runRestaurant(RestaurantFactory factory, String name, String color) {
  printWithColor('\n', name, color);
  print('-' * 40);
  final hamburger = factory.createHamburger();
  final drink = factory.createDrink();
  hamburger.prepare();
  drink.pour();
}

void main() {
  runRestaurant(FastFoodRestaurantFactory(), 'Fast Food Restaurant', 'red');
  runRestaurant(HealthyRestaurantFactory(), 'Healthy Restaurant', 'green');
}
