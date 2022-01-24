import 'package:calculator/NewButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  MyCalculatorState createState() => MyCalculatorState();
}

class MyCalculatorState extends State<MyCalculator> {
  String output = '0';


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
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    child: Text(output,
                        style: const TextStyle(
                          fontSize: 60.0,
                          fontWeight: FontWeight.bold,
                        )),
                    color: Colors.white,
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
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(flex: 1, child: NewButton('AC')),
                                Flexible(flex: 1, child: NewButton('')),
                                Flexible(flex: 1, child: NewButton('%')),
                                Flexible(flex: 1, child: NewButton('\u00F7')),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(flex: 1, child: NewButton('7')),
                                Flexible(flex: 1, child: NewButton('8')),
                                Flexible(flex: 1, child: NewButton('9')),
                                Flexible(flex: 1, child: NewButton('\u00D7')),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(flex: 1, child: NewButton('4')),
                                Flexible(flex: 1, child: NewButton('5')),
                                Flexible(flex: 1, child: NewButton('6')),
                                Flexible(flex: 1, child: NewButton('-')),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(flex: 1, child: NewButton('1')),
                                Flexible(flex: 1, child: NewButton('2')),
                                Flexible(flex: 1, child: NewButton('3')),
                                Flexible(flex: 1, child: NewButton('+')),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(flex: 2, child: NewButton('0')),
                                Flexible(flex: 1, child: NewButton('.')),
                                Flexible(flex: 1, child: NewButton('=')),
                              ],
                            ),
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
