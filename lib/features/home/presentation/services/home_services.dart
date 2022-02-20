import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/core/networks/api_request.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/locator.dart';
import 'package:observable_ish/observable_ish.dart';

abstract class HomeService with ReactiveServiceMixin {
  HomeService() {
    listenToReactiveValues([_homeModel]);
  }

  final RxValue<List<HomeModel>>? _homeModel = RxValue([]);
  List<HomeModel>? get homeModel => _homeModel!.value;

  Future<void> getTasks();
  void removeTask(task);
  void addTask(HomeModel taskTitle);
}

class HomeServiceImpl extends HomeService {
  final ApiServiceRequester _apiServiceRequester = sl<ApiServiceRequester>();

  @override
  Future<void> getTasks() async {
    try {
      final res = await _apiServiceRequester.getRequest(url: 'users/1/posts');
      var taskData = <HomeModel>[];
      for (var item in res.data) {
        taskData.add(HomeModel.fromJson(item));
      }
      _homeModel!.value = taskData;
      notifyListeners();
    } catch (e) {
      Logger().d('$e');
    }
  }

  @override
  void removeTask(task) {
    _homeModel!.value.remove(task);
    notifyListeners();
  }

  @override
  void addTask(HomeModel taskTitle) {
    _homeModel!.value.add(taskTitle);
    notifyListeners();
  }
}
