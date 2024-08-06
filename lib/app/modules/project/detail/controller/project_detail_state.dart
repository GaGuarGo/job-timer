part of 'project_detail_controller.dart';

enum ProjectDetailStatus { initial, loading, complete, failure }

class ProjectDetailState extends Equatable {
  const ProjectDetailState({required this.status, this.projectModel});
  final ProjectDetailStatus status;
  final ProjectModel? projectModel;

  const ProjectDetailState._({
    required this.status,
    this.projectModel,
  });

  const ProjectDetailState.initial()
      : this._(status: ProjectDetailStatus.initial);
  ProjectDetailState copyWith(
      {ProjectDetailStatus? status, ProjectModel? projectModel}) {
    return ProjectDetailState(
        status: status ?? this.status,
        projectModel: projectModel ?? this.projectModel);
  }

  @override
  List<Object?> get props => [status, projectModel];
}
