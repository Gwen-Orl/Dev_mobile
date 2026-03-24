import 'package:flutter/material.dart';
import 'package:projet2/UI/EcranSetting.dart';
import 'package:projet2/UI/ecran1.dart';
import 'package:projet2/UI/ecran2.dart';
import 'package:projet2/UI/ecran3.dart';

import 'AddTask.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {

  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}
class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    ecran1(),
    ecran2(),
    ecran3(),
    EcranSetting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter TD2', style: Theme.of(context).appBarTheme.titleTextStyle)),  // A modifier ici , style : Theme.of(context).appBarTheme.titleTextStyle
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'API'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'API REST'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: _selectedIndex==0?FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTask(),
          )
          );
        },
        child: const Icon(Icons.add),):const SizedBox.shrink(),
    );
  }
}