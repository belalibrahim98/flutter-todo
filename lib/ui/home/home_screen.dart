import 'package:flutter/material.dart';
import 'package:todo_app/constants/app_colors.dart';
import 'package:todo_app/ui/home/list/task_bottom_sheet.dart';
import 'package:todo_app/ui/home/list/tasks_list_tab.dart';
import 'package:todo_app/ui/home/settings/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        // titleSpacing: 52,
        title: Text(
          "ToDo List",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // toolbarHeight: MediaQuery.of(context).size.height * 0.19,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTaskBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Todo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.primaryColor,
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
          ),
          Expanded(
            child: selectedIndex == 0
                ? Padding(
                    padding: MediaQuery.of(context).padding.copyWith(
                        top: MediaQuery.of(context).size.height * 0.037),
                    child: const TasksListTab())
                : const SettingsTab(),
            //tabs[selectedIndex],
          ),
        ],
      ),
    );
  }

  void addTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      // isScrollControlled: true,
      // useSafeArea: true,
      context: context,
      builder: (context) => const TaskBottomSheet(),
    );
  }

  // List<Widget> tabs = [
  //   const TasksListTab(),
  //   const SettingsTab(),
  // ];
}
