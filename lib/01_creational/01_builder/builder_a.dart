import '../../utils/print_with_color.dart';

class Computer {
  String cpu = 'cpu - não definido';
  String ram = 'ram - não definido';
  String storage = 'armazenamento - não definido';
  String? gpu;

  void displayConfiguration() {
    printWithColor('Configuração do Meu PC:', 'blue');
    print('CPU: $cpu');
    print('RAM: $ram');
    print('Armazenamento: $storage');
    print('GPU: $gpu\n');
  }
}

class ComputerBuilder {
  final Computer _computer = Computer();

  ComputerBuilder setCPU(String cpu) {
    _computer.cpu = cpu;
    return this;
  }

  ComputerBuilder setRAM(String ram) {
    _computer.ram = ram;
    return this;
  }

  ComputerBuilder setStorage(String storage) {
    _computer.storage = storage;
    return this;
  }

  ComputerBuilder setGPU(String gpu) {
    _computer.gpu = gpu;
    return this;
  }

  Computer build() {
    return _computer;
  }
}

void main() {
  final myPC = ComputerBuilder()
      .setCPU('Intel Core i9')
      .setRAM('32GB')
      .setStorage('1TB SSD')
      .setGPU('NVIDIA RTX 4080')
      .build();

  myPC.displayConfiguration();
}
