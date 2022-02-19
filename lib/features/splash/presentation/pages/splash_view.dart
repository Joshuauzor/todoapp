import 'package:flutter/material.dart';
import 'package:todo/app/app.dart';
import 'package:todo/features/splash/presentation/viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel _splashModel = SplashViewModel();

  @override
  void initState() async {
    await _splashModel.getList(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(),
    );
  }
}
