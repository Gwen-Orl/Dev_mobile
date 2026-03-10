import 'package:flutter/material.dart';
import '../modele/task.dart';

class detail extends StatelessWidget {
  const detail({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(task.title),
      ),
    );
  }
}