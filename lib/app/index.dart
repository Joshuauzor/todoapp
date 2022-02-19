import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/navigators/navigators.dart';
import 'package:todo/features/home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'JoshTodoApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Routes.splashView,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
