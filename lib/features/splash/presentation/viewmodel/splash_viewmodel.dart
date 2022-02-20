import 'package:flutter/material.dart';
import 'package:todo/core/core.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/features/home/presentation/services/home_services.dart';
import 'package:todo/locator.dart';

class SplashViewModel extends BaseModel {
  final HomeService _homeService = sl<HomeService>();

  List<HomeModel>? get _tasks => _homeService.homeModel;
  List<HomeModel>? get tasks => _tasks;

  Future getList({required BuildContext context}) async {
    setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    await _homeService.getTasks();
    await Navigator.pushNamed(context, Routes.homeView);
    setBusy(false);
  }
}
