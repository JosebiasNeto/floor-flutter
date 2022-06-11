import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'Item.dart';
import 'dao.dart';

part 'itemdatabase.g.dart';

@Database(version: 1,entities: [Item])
abstract class ItemDatabase extends FloorDatabase
{
  ItemDao get itemDao;
}