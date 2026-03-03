
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../modele/task.dart';


class MyAPI{
  Future<List<Task>> getTasks() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('assets/json/tasks.json');
    final Map<String,dynamic> json = jsonDecode(dataString);
    if (json['tasks']!=null){
      final tasks = <Task>[];
      json['tasks'].forEach((element){
        tasks.add(element);
      });
      return tasks;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}