import 'dart:async';

import 'package:dojoapp/data/datasource/local/converters/list_int_converters.dart';
import 'package:dojoapp/data/datasource/local/daos/movie_dao.dart';
import 'package:floor/floor.dart';

import '../../../domain/entities/movie.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'movie_database.g.dart';

@TypeConverters([ListIntConverter])
@Database(version: 1, entities: [Movie])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
