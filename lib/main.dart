import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:jadio_recorder_ui/views/pages/program/page.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Jadio Recorder App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ProgramPage(),
    );
  }
}
