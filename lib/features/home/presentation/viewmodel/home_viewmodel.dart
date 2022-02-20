import 'package:stacked/stacked.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/services/home_services.dart';
import 'package:todo/locator.dart';

class HomeViewModel extends ReactiveViewModel {
  final HomeService _homeService = sl<HomeService>();

  List<HomeModel>? get _tasks => _homeService.homeModel;
  List<HomeModel>? get tasks => _tasks;

  void addTask(String taskTitle) {
    setBusy(true);
    final task = HomeModel(userId: 1, id: 1, name: taskTitle, body: 'body');
    _homeService.addTask(task);
    setBusy(false);
  }

  void removeTask(task) async {
    setBusy(true);
    // _tasks!.remove(task);
    _homeService.removeTask(task);
    setBusy(false);
  }

  void updateTask(HomeModel task) {
    setBusy(true);
    task.toggleDone();
    setBusy(false);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_homeService];
}

class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
