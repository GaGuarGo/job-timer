import 'package:isar/isar.dart';

abstract class DataBase {
  Future<Isar> openConnection();
}
