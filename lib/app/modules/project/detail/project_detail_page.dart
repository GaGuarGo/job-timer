import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/project/detail/controller/project_detail_controller.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_detail_appbar.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_pie_chart.dart';
import 'package:job_timer/app/modules/project/detail/widgets/project_task_tile.dart';
import 'package:job_timer/app/view_model/project_model.dart';

class ProjectDetailPage extends StatelessWidget {
  final ProjectDetailController controller;

  const ProjectDetailPage({super.key, required this.controller});

  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProjectDetailController, ProjectDetailState>(
        bloc: controller,
        listener: (context, state) {
          if (state.status == ProjectDetailStatus.failure) {
            AsukaSnackbar.alert('Erro interno');
          }
        },
        builder: (context, state) {
          final projectModel = state.projectModel;

          switch (state.status) {
            case ProjectDetailStatus.initial:
              return const Center(child: Text('Carregando Projeto...'));
            case ProjectDetailStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ProjectDetailStatus.complete:
              return _buildProjectDetail(context, projectModel!);
            case ProjectDetailStatus.failure:
              if (projectModel != null) {
                return _buildProjectDetail(context, projectModel);
              }

              return const Center(child: Text('Erro ao Carregar Projeto'));
          }
        },
      ),
    );
  }

  Widget _buildProjectDetail(BuildContext context, ProjectModel projectModel) {
    final totalTask = projectModel.tasks.fold(
      0,
      (totalValue, task) {
        return totalValue += task.duration;
      },
    );

    return CustomScrollView(
      slivers: [
        ProjectDetailAppbar(projectModel: projectModel),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: ProjectPieChart(
              projectEstimate: projectModel.estimate,
              totalTask: totalTask,
            ),
          ),
          ...projectModel.tasks
              .map((task) => ProjectTaskTile(projectTaskModel: task))
              // ignore: unnecessary_to_list_in_spreads
              .toList(),
        ])),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Visibility(
                visible: projectModel.status != ProjectStatus.finalizado,
                child: ElevatedButton.icon(
                    onPressed: () {
                      controller.finishProject();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    icon: const Icon(Icons.check_circle),
                    label: const Text("Finalizar Projeto")),
              ),
            ),
          ),
        )
      ],
    );
  }
}
