import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/view_model/project_task_model.dart';

class ProjectModel {
  ProjectModel(
      {required this.name,
      required this.estimate,
      required this.status,
      required this.tasks,
      this.id});

  final int? id;
  final String name;
  final int estimate;
  final ProjectStatus status;
  final List<ProjectTaskModel> tasks;

  factory ProjectModel.fromEntity(Project project) {
    project.tasks.loadSync();

    return ProjectModel(
      name: project.name,
      estimate: project.estimate,
      status: project.status,
      tasks: project.tasks.map(ProjectTaskModel.fromEntity).toList(),
    );
  }
}
