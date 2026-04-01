import 'package:flutter/material.dart';
import 'package:projet2/modele/task.dart';
import 'package:projet2/viewmodel/task_view_model.dart';
import 'package:provider/provider.dart';

import 'modifyTask.dart';


class ecran1 extends StatelessWidget {
  late List<Task> myTasks;

  ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    myTasks = context.watch<TaskViewModel>().liste;
    return ListView.builder(
        itemCount: myTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 7,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.greenAccent, child:Text(myTasks[index].id.toString())),
              title:Text(myTasks[index].title),
              subtitle: Text(myTasks[index].tags.join(" ")),
              trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => modifyTask(task:myTasks[index],))
                    );
                  },
              ),
            )
          );
        }
    );
  }
}

