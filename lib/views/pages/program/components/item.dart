import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:jadio_recorder_ui/models/program.dart';

class ProgramItem extends StatelessWidget {
  const ProgramItem({
    super.key,
    required this.program,
  });

  final Program program;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Get.to(
      //     ProgramDetailPage(program: program),
      //     fullscreenDialog: true,
      //   );
      // },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(program.name),
          ],
        )
      )
    );
  }
}
