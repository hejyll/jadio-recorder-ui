import 'package:flutter/material.dart';

class ProgramPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProgramPageAppBar({super.key});

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Jadio Recorder'),
    );
  }
}
