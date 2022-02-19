import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/styles/colors.dart';
import 'package:todo/features/home/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeViewModel(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  Gap(30),
                  Text(
                    'Todo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   '${Provider.of<TaskData>(context).taskCount} Tasks',
                  //   style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                // child: TasksList(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const AddTodoScreen(),
            );
          },
        ),
      ),
    );
  }
}
