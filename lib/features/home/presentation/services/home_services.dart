import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:todo/core/networks/api_request.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/locator.dart';

abstract class HomeService with ReactiveServiceMixin {
  List<HomeModel>? _homeModel;
  List<HomeModel>? get homeModel => _homeModel;
  Future<void> getTasks();
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
      _homeModel = taskData;

      notifyListeners();
    } catch (e) {
      Logger().d('$e');
    }
  }
}
