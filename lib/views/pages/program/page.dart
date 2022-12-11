import 'package:flutter/material.dart';
import 'package:jadio_recorder_ui/views/pages/program/components/app_bar.dart';
import 'package:jadio_recorder_ui/views/pages/program/components/body.dart';

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProgramPageAppBar(),
      body: ProgramPageBody(),
    );
  }
}
