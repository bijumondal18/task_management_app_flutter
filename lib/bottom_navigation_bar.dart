import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/common.dart';
import 'features/screens.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;

  final List screens = const [
    TaskListScreen(),
    CreateTaskScreen(),
    TaskHistoryScreen()
  ];

  final PageStorageBucket _bucket = PageStorageBucket();
  Widget currentScreen = const TaskListScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: _bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CreateTaskScreen()));
        },
        child: const Icon(
          Icons.add_circle_outline_sharp,
          size: 40,
        ),
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          margin: const EdgeInsets.only(top: AppSizes.padding8),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const TaskListScreen();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.list_alt_rounded,
                          color: currentIndex == 0
                              ? AppColors.primary
                              : AppColors.lightGrey,
                        ),
                        Text(
                          'Task List',
                          style: TextStyle(
                              color: currentIndex == 0
                                  ? AppColors.primary
                                  : AppColors.lightGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: AppSizes.padding24),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = const TaskHistoryScreen();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.history_rounded,
                          color: currentIndex == 1
                              ? AppColors.primary
                              : AppColors.lightGrey,
                        ),
                        Text(
                          'Task History',
                          style: TextStyle(
                              color: currentIndex == 1
                                  ? AppColors.primary
                                  : AppColors.lightGrey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
