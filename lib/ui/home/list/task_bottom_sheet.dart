import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.add_new_task,
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
                        return AppLocalizations.of(context)!
                            .please_enter_task_name;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      hintText: AppLocalizations.of(context)!.enter_task_name,
                      hintStyle: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 38),
                  Text(
                    AppLocalizations.of(context)!.select_due_date,
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
                          ? AppLocalizations.of(context)!.no_date_selected
                          : formatter.format(_selectedDate!),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  const SizedBox(height: 38),
                  ElevatedButton(
                    onPressed: () {
                      addTask();
                    },
                    child: Text(AppLocalizations.of(context)!.add_task),
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
