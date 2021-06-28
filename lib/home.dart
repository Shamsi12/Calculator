import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var result="";
  
  Widget btn(var text) {
    return ElevatedButton(onPressed: () { setState((){ result = result + text; });},
                          child: Text(text, style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                          style: ElevatedButton.styleFrom(
                                    primary: Colors.teal,
                                    textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          );
  }

  output(){
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel em = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, em);
    setState(() {
      result = eval.toString();
    });
  }
  
  clear(){
  setState((){ result="";});
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue[500],  ),
              child: Center(child: Title(color: Colors.white,
                                  child: Text("CALCULATOR", style: TextStyle(fontSize: 50, 
                                                                             fontWeight: FontWeight.bold,
                                                                             color: Colors.white ),))),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("1"), btn("2"), btn("3"), btn("4"),],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("5"), btn("6"), btn("7"), btn("8"),],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("9"), btn("0"), 
                         ElevatedButton(onPressed: output, child: Text("=", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                                        style: ElevatedButton.styleFrom(primary: Colors.teal),),
                         ElevatedButton(onPressed: clear, child: Text("clear", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),),
                                        style: ElevatedButton.styleFrom(primary: Colors.teal),),],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [btn("+"), btn("-"), btn("*"), btn("/"),],
            ),
            SizedBox(height: 10,),
            
            Text("Answer:", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
            SizedBox(height: 10),
            Container(
              height: 30,
              width: 250,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: Colors.teal,  ),
              child: Text(result, 
                          style: TextStyle( fontSize: 30, 
                                            fontWeight: FontWeight.bold, 
                                            backgroundColor: Colors.white),)),
          ], // column children
        ),
      ),
    );
  }
}




