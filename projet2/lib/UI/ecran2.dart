import 'package:flutter/material.dart';
import '../modele/task.dart';
import 'package:flutter/material.dart';
import '../api/myapi.dart';

class ecran2 extends StatelessWidget {
  ecran2({super.key});
  @override
  Widget build(BuildContext context) {
    Future<List<Task>> tasks=MyAPI().getTasks();
    //print(tasks.length);
    return ListView.builder(
      itemBuilder : (BuildContext context ,int index) {
        return Card(
            color: Colors.black,
            elevation: 7,
            margin: const EdgeInsets.all(10),
            child:
            FutureBuilder <List<Task>>(
                future: tasks,
                builder: (BuildContext context, AsyncSnapshot<List<Task>> snapshot) {
                  List<Widget> child;
                  if (snapshot.hasData) {
                    child = <Widget>[
                      Card(
                        color: Colors.black,
                        elevation: 7,
                        margin: const EdgeInsets.all(10),
                        child:ListTile(
                          leading: CircleAvatar(backgroundColor: Colors.green, child:Text(snapshot.data?[index].id.toString()??""),),
                          title: Text(snapshot.data?[index].title??""),
                          subtitle: Text(snapshot.data?[index].tags.join(" ")??""),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                            },
                          ),
                        ),
                      )
                    ];
                  } else if (snapshot.hasError) {
                    child = <Widget>[
                      const Icon(Icons.error_outline, color: Colors.red, size: 60),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Error: ${snapshot.error}'),
                      ),
                    ];
                  } else {
                    child = const <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text('Awaiting result...'),
                      ),
                    ];
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: child,
                    ),

                  );
                }
            )
        );
      },
    );

  }
}