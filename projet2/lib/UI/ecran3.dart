import 'package:flutter/material.dart';

class ecran3 extends StatelessWidget {
  const ecran3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ecran Foucher'),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        backgroundColor: Colors.brown,
        body: NotificationListener(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Villerable"),
                  ],
                )
            )
        )
    );
  }
}

