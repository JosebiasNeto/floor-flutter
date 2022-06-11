import 'package:floor/floor.dart';

@entity
class Item{
  @primaryKey
  final int? id;
  final String nome;
  late final bool checked;

  Item(this.nome, this.checked, this.id);
}