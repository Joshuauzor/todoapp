import 'package:flutter/material.dart';

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox(
      {Key? key,
      required this.checkboxState,
      required this.toggleCheckboxState})
      : super(key: key);
  final bool checkboxState;
  final Function(bool?)? toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
