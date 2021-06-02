import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _output = '0';
  String output = '0';
  double num1=0, num2=0;
  String operand = '';

  operation(String btnText){
    if(btnText=="C"){
    _output ='0';
    num1= 0;
    num2= 0;
    operand = "";
    }
    else if(btnText=="+"||btnText=="-"||btnText=="/"||btnText=="*"){
    num1 = double.parse(output);
    operand = btnText;
    _output = "";
    }
    else if(btnText=='='){
      num2 = double.parse(output);
      if(operand=="+"){
        _output = (num1 + num2).toString();
      }
      if(operand=="-"){
        _output = (num1 -num2).toString();
      }
      if(operand=="*"){
        _output = (num1 * num2).toString();
      }
      if(operand=="/"){
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand= "";
    }
    else{
      _output = _output + btnText;
    }
    setState(() {
      output = double.parse(_output).toString();
    });
  }

  Widget button(String btnText) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.black, width: 2),
        splashColor: Colors.black,
        fillColor: Colors.black12,
        padding: EdgeInsets.all(30.0),
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w900),
        ),
        onPressed: () {
          operation(btnText);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 4.0),
                    // color: Colors.black12,
                  ),
                  child: Text(
                    '$output',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
              Row(
                children: [
                  button('9'),
                  button('8'),
                  button('7'),
                  button('C'),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button('6'),
                  button('5'),
                  button('4'),
                  button('+'),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button('3'),
                  button('2'),
                  button('1'),
                  button('-'),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  button('0'),
                  button('*'),
                  button('/'),
                  button('='),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
