import 'package:calculator/new_button.dart';
import 'package:flutter/material.dart';
import 'my_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const CalculatorUi(),
    );
  }
}

class CalculatorUi extends StatefulWidget {
  const CalculatorUi({Key? key}) : super(key: key);

  @override
  CalculatorUiState createState() => CalculatorUiState();
}

class CalculatorUiState extends State<CalculatorUi> {
  final calculator = MyCalculator();

  String output = '0.00';
  String _output = '0';
  double a = 0.0;
  double b = 0.0;
  String operand = '';

  onButtonPress(String text) {

    if (text == 'AC') {

      _output = '0';
      a = 0;
      b = 0;
      operand = '';

    } else if (text == '+' || text == '-' || text == '\u00D7' || text == '/' || text == '%') {

      a = double.parse(output);
      operand = text;
      _output = '0';

    }else if (text == '.') {

      _output = _output + text;

    } else if (text == '=') {

      b = double.parse(output);

      if (operand == '+') {
        _output = (a + b).toString();
      }
      if (operand == '-') {
        _output = (a - b).toString();
      }
      if (operand == '\u00D7') {
        _output = (a * b).toString();
      }
      if (operand == '/') {
        _output = (a / b).toString();
      }
      if (operand == '%') {
        _output = (a % b).toString();
      }
      a = 0.0;
      b = 0.0;
      operand = '';
    } else {
      _output = _output + text;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.black,
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 4,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Text(output,
                            style: const TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  flex: 2,
                                  child: NewButton(
                                      'AC',() => onButtonPress('AC'),
                                  )),
                              Flexible(
                                  child:
                                      NewButton('%', () => onButtonPress('%'))),
                              Flexible(
                                  child:
                                      NewButton('/', () => onButtonPress('/'))),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child:
                                      NewButton('7', () => onButtonPress('7'))),
                              Flexible(
                                  child:
                                      NewButton('8', () => onButtonPress('8'))),
                              Flexible(
                                  child:
                                      NewButton('9', () => onButtonPress('9'))),
                              Flexible(
                                  child:
                                      NewButton('\u00D7', () => onButtonPress('\u00D7'))),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child:
                                      NewButton('4', () => onButtonPress('4'))),
                              Flexible(
                                  child:
                                      NewButton('5', () => onButtonPress('5'))),
                              Flexible(
                                  child:
                                      NewButton('6', () => onButtonPress('6'))),
                              Flexible(
                                  child:
                                      NewButton('-', () => onButtonPress('-'))),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child:
                                      NewButton('1', () => onButtonPress('1'))),
                              Flexible(
                                  child:
                                      NewButton('2', () => onButtonPress('2'))),
                              Flexible(
                                  child:
                                      NewButton('3', () => onButtonPress('3'))),
                              Flexible(
                                  child:
                                      NewButton('+', () => onButtonPress('+'))),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  flex: 2,
                                  child:
                                      NewButton('0', () => onButtonPress('0'))),
                              Flexible(
                                  child:
                                      NewButton('.', () => onButtonPress('.'))),
                              Flexible(
                                  child:
                                      NewButton('=', () => onButtonPress('='))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
