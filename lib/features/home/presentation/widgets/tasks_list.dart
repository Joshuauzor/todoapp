import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/widgets/tasks_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = model.tasks![index];
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
          itemCount: model.tasks!.length,
        );
      },
    );
  }
}
