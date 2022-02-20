import 'package:todo/core/core.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/services/home_services.dart';
import 'package:todo/locator.dart';

class HomeViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();

  List<HomeModel>? get _tasks => _homeService.homeModel;
  List<HomeModel>? get tasks => _tasks;

  // List<HomeModel>? homeModel;
  // List<HomeModel>? get homeModel => _homeModel;

  void addTask(String taskTitle) {
    setBusy(true);
    final task = HomeModel(userId: 1, id: 1, name: taskTitle, body: 'body');
    _tasks!.add(task);
    setBusy(false);
  }

  void removeTask(task) {
    setBusy(true);
    _tasks!.remove(task);
    setBusy(false);
  }

  void updateTask(HomeModel task) {
    setBusy(true);
    task.toggleDone();
    setBusy(false);
  }
}

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
