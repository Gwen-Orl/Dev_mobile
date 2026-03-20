import 'package:flutter/material.dart';
import 'package:projet2/UI/mytheme.dart';
import 'package:projet2/viewmodel/setting_view_model.dart';
import 'package:projet2/viewmodel/task_view_model.dart';
import 'package:provider/provider.dart';

import 'UI/home.dart';

void main() {
  runApp(MyTD2());
}

class MyTD2 extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_){
              SettingViewModel settingViewModel = SettingViewModel();
//getSettings est deja appelee dans le constructeur
              return settingViewModel;
            }),
        ChangeNotifierProvider(
            create:(_){
              TaskViewModel taskViewModel = TaskViewModel();
              taskViewModel.generateTasks();
              return taskViewModel;
            } )
      ],
      child: Consumer<SettingViewModel>(
        builder: (context,SettingViewModel notifier,child){
          return MaterialApp(
              theme: notifier.isDark ? MyTheme.dark():MyTheme.light(),
              title: 'TD2',
              home: BottomNavigationBarExampleApp()
          );
        },
      ),
    );
  }
}
