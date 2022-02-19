import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app.dart';
import 'package:todo/features/home/home.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({Key? key}) : super(key: key);

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.addContainerColor,
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BodyText(
                'Add Task',
                textAlign: TextAlign.center,
                fontSize: 30,
              ),
              TextFormField(
                autofocus: true,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: AppColors.primaryColor, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*Task is required';
                  }
                  return null;
                },
                // onChanged: (value) {
                //   taskTitleInput = value;
                // },
              ),
              const Gap(10),
              TouchableOpacity(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    // add
                    Provider.of<HomeViewModel>(context, listen: false)
                        .addTask(taskTitleInput);
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: const BodyText(
                    'Add',
                    color: AppColors.white,
                    textAlign: TextAlign.center,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
