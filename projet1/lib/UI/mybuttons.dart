import 'package:flutter/material.dart';

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


class IndexChanged extends Notification{
  final int val;
  IndexChanged(this.val);
}

class MyIconButton extends StatelessWidget{
  IconData myIcon;
  int value;
  MyIconButton({super.key, required this.myIcon,required this.value});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => IndexChanged(value).dispatch(context),
      child: Icon(
        myIcon,
        color: Colors.white,
      ),
    );
  }
}