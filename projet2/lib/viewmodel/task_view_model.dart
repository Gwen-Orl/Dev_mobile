import 'package:flutter/cupertino.dart';

import '../modele/task.dart';

class TaskViewModel extends ChangeNotifier{
  late List<Task> liste;
  TaskViewModel(){
    liste=[];
  }
  void addTask(Task task){
    liste.add(task);
    notifyListeners();
  }

  void editTask(Task task, String title, String tags, int nbhours, int difficulty, String description){
    int index = liste.indexWhere((t) => t.id == task.id);
    if (index != -1){
      List<String> tagsList = tags
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();

      liste[index] = Task(
          id: task.id,
          title: title,
          tags: tagsList,
          nbhours: nbhours,
          difficulty: difficulty,
          description: description
      );
      notifyListeners();
    }
  }

  void generateTasks(){
    liste = Task.generateTask(50);
    notifyListeners();
  }
}
