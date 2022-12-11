import 'package:flutter/material.dart';
import 'package:jadio_recorder_ui/models/program.dart';
import 'package:jadio_recorder_ui/views/pages/program/components/item.dart';

class ProgramList extends StatelessWidget {
  const ProgramList({
    super.key,
    required this.data,
  });

  final List<Program> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return ProgramItem(program: data[index]);
        },
        childCount: data.length,
      ),
    );
  }
}
