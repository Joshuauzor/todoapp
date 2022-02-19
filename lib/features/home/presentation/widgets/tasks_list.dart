import 'package:flutter/material.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/widgets/tasks_tile.dart';
import 'package:todojo/models/tasks.dart';
import 'package:todojo/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = model.tasks[index];
            // return task tiles
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                model.updateTask(task);
              },
              longPressCallback: () {
                model.removeTask(task);
              },
            );
          },
          itemCount: model.taskCount,
        );
      },
    );
  }
}
