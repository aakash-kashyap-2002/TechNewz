import 'package:flutter/material.dart';
import 'package:technews/utils/colors.dart';
import 'package:technews/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  const appbar({super.key})
      : preferredSize = const Size.fromHeight(50.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: SizedBox(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BoldText(text: 'Tech', color: AppColors.primary, size: 20),
            ModifiedText(text: 'Newz', color: AppColors.lightwhite, size: 20)
          ],
        ),
      ),
      centerTitle: true,
    );
  }
  
}
