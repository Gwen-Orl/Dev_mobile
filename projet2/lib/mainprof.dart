import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyTD2());
}

class MyTD2 extends StatelessWidget{
  const MyTD2({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:
        FlutterError.fromParts()
    )
  }
}