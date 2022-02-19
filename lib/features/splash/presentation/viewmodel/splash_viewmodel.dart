import 'package:flutter/material.dart';
import 'package:todo/core/navigators/navigators.dart';

class SplashViewModel extends ChangeNotifier {
  Future getList({required BuildContext context}) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, Routes.homeView);
    notifyListeners();
  }
}
