import 'package:flutter/material.dart';
import '../modele/question.dart';




import 'mybuttons.dart';
class MyWidget extends StatefulWidget{
  final Color color;

  final double textsize;

  const MyWidget(this.color, this.textsize, {super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}



class _MyWidgetState extends State<MyWidget> {


  int currentQuestion=0;

  final List questions = [Question.name("The question number 1 is a very long question and her answer is true.", true, "flag.png"),
  Question.name("The question number 2 is true again.", true,
  "img.png"),
  Question.name("The question number 3 is false.", false, "img.png"),
  Question.name("The question number 4 is false again.", false,
  "flag.png"),
  Question.name("The question number 5 is true.", true, "flag.png"),
    Question.name("The question number 6 is true again.", true,
        "img.png"),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quizz App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: widget.color,
        body: NotificationListener<IndexChanged>(
          child:Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Image.asset("images/inscris_aftec.png",width: 250,height: 180,),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Colors.black,style: BorderStyle.solid
                          )
                      ),
                      height:120.0,

                      child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child:Text(
                            questions[currentQuestion].questionText,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(),
                            ),

                          )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MyIconButton(myIcon: Icons.arrow_back, value: -1),
                        MyTextButton(
                            myText: "TRUE", myValue: true, returnValue: _handleValue),
                        MyTextButton(
                            myText: "FALSE", myValue: false, returnValue: _handleValue),
                        MyIconButton(myIcon: Icons.arrow_forward, value: 1),
                      ])])

          ),
          onNotification: (n){
              _changeQuestion(n.val);
              return true;
          },
        ));
  }

  _previousQuestion(){
    setState(() {
      currentQuestion = (currentQuestion-1)%questions.length;
    });
  }

  void _handleValue(bool value) {
    debugPrint(value.toString());
    if (value == questions[currentQuestion].isCorrect) {
      debugPrint("good");
      const mySnackBar = SnackBar(
        content: Text("GOOD ANSWER!!!",style: TextStyle(fontSize: 20)),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.lightGreen,
        width: 180.0, // Width of the SnackBar.
        padding: EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),);
      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    } else {
      debugPrint("bad");
      const mySnackBar = SnackBar(
        content: Text("BAD ANSWER!!!",style: TextStyle(fontSize: 20),),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        width: 180.0, // Width of the SnackBar.
        padding: EdgeInsets.symmetric(
          horizontal: 8.0, // Inner padding for SnackBar content.
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),);
      ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
    }
    _nextQuestion();
  }

  _nextQuestion(){
    setState(() {
      currentQuestion = (currentQuestion+1)%questions.length;
    });
  }

  _changeQuestion(int n){
    setState(() {
      currentQuestion = (currentQuestion + n) %questions.length;
    });
  }
}