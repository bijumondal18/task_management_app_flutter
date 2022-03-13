import 'package:flutter/material.dart';
import 'package:flutter_todo_app/common/common.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTheme.lightTheme.textTheme.headline5,),
    );
  }
}