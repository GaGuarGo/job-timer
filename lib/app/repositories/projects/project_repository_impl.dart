import 'dart:developer';

import 'package:isar/isar.dart';
import 'package:job_timer/app/core/database/database.dart';
import 'package:job_timer/app/core/exceptions/failure.dart';
import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';

import './project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final DataBase _database;

  ProjectRepositoryImpl({required DataBase dataBase}) : _database = dataBase;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn(() {
        return connection.projects.put(project);
      });
    } on IsarError catch (e, s) {
      log('Erro ao Cadastrar projeto', error: e, stackTrace: s);
      throw Failure(message: 'Erro ao Cadastrar projeto');
    }
  }

  @override
  Future<List<Project>> findByStatus(ProjectStatus status) async {
    final conncetion = await _database.openConnection();

    final projects =
        await conncetion.projects.filter().statusEqualTo(status).findAll();

    return projects;
  }
}
