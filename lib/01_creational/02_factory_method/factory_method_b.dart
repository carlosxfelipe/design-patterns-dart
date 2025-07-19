import 'dart:io';
import '../../utils/print_with_color.dart';

abstract class Report {
  void generate();
}

class SalesReport implements Report {
  @override
  void generate() {
    printWithColor('Gerando relatório de vendas...', 'green');
  }
}

class InventoryReport implements Report {
  @override
  void generate() {
    printWithColor('Gerando relatório de inventário...', 'orange');
  }
}

abstract class ReportFactory {
  Report _createReport(); // simula "protected"

  void generateReport() {
    final report = _createReport();
    report.generate();
  }
}

class SalesReportFactory extends ReportFactory {
  @override
  Report _createReport() => SalesReport();
}

class InventoryReportFactory extends ReportFactory {
  @override
  Report _createReport() => InventoryReport();
}

ReportFactory getReportFactory(String type) {
  switch (type) {
    case 'vendas':
      return SalesReportFactory();
    case 'estoque':
      return InventoryReportFactory();
    default:
      throw Exception('Tipo de relatório inválido: "$type"');
  }
}

void main() {
  stdout.write('Qual tipo de relatório você deseja? (vendas/estoque)\n> ');

  final input = stdin.readLineSync()?.trim().toLowerCase();

  if (input == null || input.isEmpty) {
    print('Operação cancelada.');
    return;
  }

  try {
    final factory = getReportFactory(input);
    factory.generateReport();
  } catch (e) {
    printWithColor(e.toString(), 'red');
  }
}
