import 'package:flutter/material.dart';

class ecran1 extends StatelessWidget{
  const ecran1({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Container(
          width: 100,
          decoration: BoxDecoration(border: Border.all()),
          child: const Text(
            'Hello, how are you?',
            overflow: TextOverflow.ellipsis,
          ),
        );

    throw UnimplementedError();
  }
}


class MyTextButton extends StatelessWidget{
  String myText;
  bool myValue;
  ValueChanged<bool> returnValue;
  MyTextButton({super.key, required this.myText,required this.myValue,required
  this.returnValue});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => returnValue(myValue),
      child: Text(myText,
          style: const TextStyle(color: Colors.white)),
    );
  }
}