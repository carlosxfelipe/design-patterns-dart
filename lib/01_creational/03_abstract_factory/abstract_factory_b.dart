import '../../utils/print_with_color.dart';

abstract class Vehicle {
  void assemble();
}

abstract class Engine {
  void start();
}

class ElectricCar implements Vehicle {
  @override
  void assemble() {
    print('Fabricando um carro elétrico.');
  }
}

class GasCar implements Vehicle {
  @override
  void assemble() {
    print('Fabricando um carro a combustão.');
  }
}

class ElectricEngine implements Engine {
  @override
  void start() {
    print('Ligando o motor elétrico.');
  }
}

class GasEngine implements Engine {
  @override
  void start() {
    print('Ligando o motor a combustão.');
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

void runFactory(
    VehicleFactory factory, String leading, String colored, String color) {
  printWithColor(leading, colored, color);
  print('-' * 40);
  final vehicle = factory.createVehicle();
  final engine = factory.createEngine();
  vehicle.assemble();
  engine.start();
}

void main() {
  runFactory(
      ElectricVehicleFactory(), 'Criando veículo ', 'elétrico:', 'yellow');
  runFactory(GasVehicleFactory(), '\nCriando veículo a ', 'combustão:', 'red');
}
