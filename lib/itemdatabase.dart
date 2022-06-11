import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dao.dart';
import 'Item.dart';

@Database(version: 1,entities: [Item])
abstract class ItemDatabase extends FloorDatabase
{
  ItemDao get itemDao;
}