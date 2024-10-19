import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_colors.dart';

class TaskBottomSheet extends StatefulWidget {
  const TaskBottomSheet({super.key});

  @override
  State<TaskBottomSheet> createState() => _TaskBottomSheetState();
}

class _TaskBottomSheetState extends State<TaskBottomSheet> {
  // DateTime selectedDate = DateTime.now();
  DateTime? _selectedDate;
  final formatter = DateFormat.yMd();
  var formKey = GlobalKey<FormState>();
  String title = '';
  // TextEditingController titleController = TextEditingController();
  // @override
  // void dispose() {
  //   titleController.dispose();
  //   super.dispose();
  // }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: lastDate,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // void showCalender() async {
  //   chosenDate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime.now(),
  //     lastDate: DateTime.now().add(const Duration(days: 365)),
  //   );
  //   if (selectedDate != null) {
  //      selectedDate = selectedDate;
  //   setState(() {});
  //   };
  //
  //   selectedDate = chosenDate ?? selectedDate;
  // }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 38),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    //controller: titleController,

                    onChanged: (value) {
                      title = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      hintText: 'enter your task',
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 38),
                  Text(
                    'Select Date',
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      _presentDatePicker();
                    },
                    child: Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 38),
                  ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: const Text('Add Task'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop();
    }
  }
}
