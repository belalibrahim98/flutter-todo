import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/ui/home/list/calender_widget.dart';
import 'package:todo_app/ui/home/list/task_item.dart';

class TasksListTab extends StatelessWidget {
  const TasksListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CalenderWidget(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(27),
            itemBuilder: (context, index) => const TaskItem(),
            separatorBuilder: (_, __) => const SizedBox(height: 24),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
