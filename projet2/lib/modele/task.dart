import 'package:flutter/material.dart';


class Task {
  int id;
  static int nb=0;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;
  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficulty,required this.description});
  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficulty: n, description: '$n'));
    }
    return tasks;
  }
  static Task fromJson(Map<String, dynamic> json){
    final tags = <String>[];
    final Color clr;

    clr = Colors.greenAccent;

    if (json['tags'] != null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }
    return Task(
        id: json['id'],
        title: json['title'],
        tags: tags,
        nbhours: json['nbhours'],
        difficulty: json['difficulty'],
        description: json['description'],
        );
  }

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours:
    nb, difficulty: nb%5, description: 'description $nb');
  }



  static Task createTask(title, tags, nbhours, difficulty, description){
    nb++;
    int debut_mot = 0;
    print("On crée une task");
    List<String> tags_list=[];
    for(int n=0;n<tags.length;n++){
      if(tags[n]==','){
        tags_list.add(tags.substring(debut_mot, n));
        debut_mot=n+1;
      }
    }
    return Task(id: nb, title: title, tags: tags_list, nbhours: nbhours, difficulty: difficulty, description: description);
  }


}
