

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

  void editTask(Task task, title, tags, nbhours, difficulty, description){
    int index = liste.indexWhere((t) => t.id == task.id);
    if (index != 1){
      liste[index] = task;
      notifyListeners();
    }
  }
  void generateTasks(){
    liste = Task.generateTask(50);
    notifyListeners();
  }
}