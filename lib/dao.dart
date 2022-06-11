import 'package:floor/floor.dart';
import 'Item.dart';

@dao
abstract class ItemDao {
  @Query('SELECT * FROM Item')
  Future<List<Item>> getItens();

  @Query('DELETE FROM Item WHERE id = :id')
  Future<void> findPersonById(int id);

  @insert
  Future<void> insertItem(Item item);
}

