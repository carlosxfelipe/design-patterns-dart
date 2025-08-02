import 'dart:io';
import '../../utils/ansi_colors.dart';

abstract class Report {
  void generate();
}

class SalesReport implements Report {
  @override
  void generate() {
    print(green('Gerando relatório de vendas...'));
  }
}

class InventoryReport implements Report {
  @override
  void generate() {
    print(rgb8('Gerando relatório de inventário...', 208)); // orange
  }
}

abstract class ReportFactory {
  Report _createReport();

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
    print(red(e.toString()));
  }
}
