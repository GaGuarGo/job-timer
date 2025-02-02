import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/entities/project_task.dart';
import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/view_model/project_model.dart';
import 'package:job_timer/app/view_model/project_task_model.dart';

import './project_service.dart';

class ProjectServiceImpl extends ProjectService {
  final ProjectRepository _repository;

  ProjectServiceImpl({required ProjectRepository repository})
      : _repository = repository;

  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..status = projectModel.status
      ..estimate = projectModel.estimate;

    await _repository.register(project);
  }

  @override
  Future<List<ProjectModel>> findByStatus(ProjectStatus status) async {
    final projects = await _repository.findByStatus(status);
    return projects.map(ProjectModel.fromEntity).toList();
  }

  @override
  Future<ProjectModel> findById(int projectId) async {
    final project = await _repository.findById(projectId);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task) async {
    final projectTask = ProjectTask()
      ..name = task.name
      ..duration = task.duration;

    final project = await _repository.addTask(projectId, projectTask);
    return ProjectModel.fromEntity(project);
  }

  @override
  Future<void> finish(int projectId) => _repository.finish(projectId);
}
