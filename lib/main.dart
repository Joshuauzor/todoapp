import 'package:flutter/material.dart';
import 'package:todo/app/index.dart';
import 'package:todo/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupsl();
  runApp(const MyApp());
}
