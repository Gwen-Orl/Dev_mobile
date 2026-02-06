import 'package:flutter/material.dart';

class ecran2 extends StatelessWidget {
  const ecran2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bonsoir Paris'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.lightBlue,
        body: NotificationListener(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Sullylois"),
                  ],
                )
            )
        )
    );
  }
}

