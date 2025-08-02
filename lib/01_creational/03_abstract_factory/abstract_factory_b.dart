import '../../utils/ansi_colors.dart';

abstract class Vehicle {
  void assemble();
}

abstract class Engine {
  void start();
}

/// Função utilitária para aplicar `cyan` em verbos terminados com "ando", "endo", "indo"
String highlightGerund(String text) {
  final gerundPattern =
      RegExp(r'\b(\w+?(ando|endo|indo))\b', caseSensitive: false);
  return text.replaceAllMapped(gerundPattern, (match) => cyan(match[0]!));
}

class ElectricCar implements Vehicle {
  @override
  void assemble() {
    print(highlightGerund("Fabricando um carro elétrico."));
  }
}

class GasCar implements Vehicle {
  @override
  void assemble() {
    print(highlightGerund("Fabricando um carro a combustão."));
  }
}

class ElectricEngine implements Engine {
  @override
  void start() {
    print(highlightGerund("Ligando o motor elétrico."));
  }
}

class GasEngine implements Engine {
  @override
  void start() {
    print(highlightGerund("Ligando o motor a combustão."));
  }
}

abstract class VehicleFactory {
  Vehicle createVehicle();
  Engine createEngine();
}

class ElectricVehicleFactory implements VehicleFactory {
  @override
  Vehicle createVehicle() => ElectricCar();

  @override
  Engine createEngine() => ElectricEngine();
}

class GasVehicleFactory implements VehicleFactory {
  @override
  Vehicle createVehicle() => GasCar();

  @override
  Engine createEngine() => GasEngine();
}

void main() {
  print('Criando veículo ${yellow('elétrico')}:');
  {
    final factory = ElectricVehicleFactory();
    final vehicle = factory.createVehicle();
    final engine = factory.createEngine();
    vehicle.assemble();
    engine.start();
  }

  print('\nCriando veículo a ${red('combustão')}:');
  {
    final factory = GasVehicleFactory();
    final vehicle = factory.createVehicle();
    final engine = factory.createEngine();
    vehicle.assemble();
    engine.start();
  }
}
