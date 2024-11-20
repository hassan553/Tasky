import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt/core/extension/text_extension.dart';
import 'package:tt/core/utils/app_functions.dart';
import 'package:tt/core/utils/app_images.dart';
import 'package:tt/features/add_task/logic/add_task_cubit.dart';

import '../../../../components/custom_button.dart';
import '../../../../components/custom_drop_down_menu.dart';
import '../../../../components/text_field_component.dart';
import '../../../../core/services/setup/getIt.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_validation_functions.dart';
import '../../data/repo/add_task_repo.dart';
import '../widgets/add_image_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var priorityController = TextEditingController(text: 'low');
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    priorityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task', style: context.f16700),
      ),
      body: BlocProvider(
        create: (context) => AddTaskCubit(addTaskRepo: getIt<AddTaskRepo>()),
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 10),
              BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  return DottedBorderIcon(
                    size: 30.w,
                    icon: AppImages.addImage,
                    image: BlocProvider.of<AddTaskCubit>(context).image,
                    onTap: () {
                      BlocProvider.of<AddTaskCubit>(context).takeTaskImage();
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              TextFieldComponent(
                title: 'Task Title',
                hint: 'Write task title',
                keyboardType: TextInputType.name,
                controller: titleController,
                validator: (v) =>
                    AppValidationFunctions.stringValidationFunction(v, 'title'),
              ),
              const SizedBox(height: 20),
              TextFieldComponent(
                title: 'Task Description',
                hint: 'Write task description',
                keyboardType: TextInputType.name,
                controller: descriptionController,
                maxlines: 4,
                validator: (v) =>
                    AppValidationFunctions.stringValidationFunction(
                        v, 'description'),
              ),
              const SizedBox(height: 20),
              TextFieldComponent(
                title: 'Task time',
                hint: 'Write task time',
                isReadOnly: true,
                onPress: () async {
                  var date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(20100),
                  );
                  if (date != null) {
                    dateController.text = dateFormat(date);
                  }
                },
                controller: dateController,
                validator: (v) =>
                    AppValidationFunctions.stringValidationFunction(v, 'date'),
              ),
              const SizedBox(height: 30),
              CustomDropdown(
                onChanged: (p0) {
                  priorityController.text = p0.toString();
                },
                initialValue: 'low',
              ),
              const SizedBox(height: 30),
              BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  return state is AddTaskLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: 'Add Task',
                          color: AppColors.whiteColor,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<AddTaskCubit>(context)
                                  .uploadImage(
                                image: BlocProvider.of<AddTaskCubit>(context)
                                    .image!,
                                title: titleController.text,
                                desc: descriptionController.text,
                                priority: priorityController.text,
                                dueDate: dateController.text,
                              );
                            }
                          });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
