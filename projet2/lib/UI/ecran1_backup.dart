import 'package:flutter/material.dart';
import 'package:projet2/modele/task.dart';


class ecran1 extends StatelessWidget {
  late List<Task> myTasks;

  ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    myTasks = Task.generateTask(5);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ecran Wyatt'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.teal,
        body: NotificationListener(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Chaptain Ville"),
                  ],
                )
            )
        )
    );
  }
}

