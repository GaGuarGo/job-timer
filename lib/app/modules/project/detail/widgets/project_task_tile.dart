import 'package:flutter/material.dart';
import 'package:job_timer/app/view_model/project_task_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskModel projectTaskModel;
  const ProjectTaskTile({super.key, required this.projectTaskModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(projectTaskModel.name),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                    text: 'Duração', style: TextStyle(color: Colors.grey)),
                const TextSpan(text: '       '),
                TextSpan(
                    text: "${projectTaskModel.duration}h",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
