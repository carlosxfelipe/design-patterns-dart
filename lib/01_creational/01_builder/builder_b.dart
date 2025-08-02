import '../../utils/ansi_colors.dart';

class QueryBuilder {
  final String _table;
  final List<String> _fields = [];
  final List<String> _conditions = [];
  final List<String> _orderFields = [];
  int? _limitCount;

  QueryBuilder(this._table);

  QueryBuilder select(List<String> fields) {
    _fields.clear();
    _fields.addAll(fields.isNotEmpty ? fields : ['*']);
    return this;
  }

  QueryBuilder where(String condition) {
    _conditions.add(condition);
    return this;
  }

  QueryBuilder orderBy(String field, [String direction = 'ASC']) {
    _orderFields.add('$field $direction');
    return this;
  }

  QueryBuilder limit(int count) {
    _limitCount = count;
    return this;
  }

  String execute() {
    final parts = [
      'SELECT ${_fields.isNotEmpty ? _fields.join(', ') : '*'}',
      'FROM $_table',
      _conditions.isNotEmpty ? 'WHERE ${_conditions.join(' AND ')}' : '',
      _orderFields.isNotEmpty ? 'ORDER BY ${_orderFields.join(', ')}' : '',
      _limitCount != null ? 'LIMIT $_limitCount' : '',
    ];

    return parts.where((part) => part.isNotEmpty).join(' ');
  }
}

void main() {
  final usersQuery = QueryBuilder('users')
      .select(['id', 'name', 'email'])
      .where('age > 18')
      .where("country = 'Brazil'")
      .orderBy('name', 'ASC')
      .limit(10)
      .execute();

  print(red('Consulta:'));
  print(usersQuery);
}
