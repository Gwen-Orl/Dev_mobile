import 'package:flutter/material.dart';
import '../modele/task.dart';
import 'package:flutter/material.dart';
import '../api/myapi.dart';
import 'detail.dart';

class ecran2 extends StatelessWidget {
  ecran2({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MyAPI().getTasks(),
        builder: (context, snapshot){
          if (snapshot.connectionState!=ConnectionState.done && !snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data != null){
            return ListView.builder(
              itemCount: snapshot.data?.length??0,
              itemBuilder: (BuildContext context, index){
                return Card(
                  color: Colors.white,
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child :
                  ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.green, child:Text(snapshot.data?[index].id.toString()??""),),
                    title: Text(snapshot.data?[index].title??""),
                    subtitle: Text(snapshot.data?[index].tags.join(" ")??""),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => detail(task: snapshot.data![index]),
                        ),
                      );
                    },
                  )
                );
              }
              );
            }

          return Container();
        }

    );
  }
}
