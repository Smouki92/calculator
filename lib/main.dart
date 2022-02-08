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
      debugShowCheckedModeBanner: false,
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

  void onButtonPress(Button button) {
    setState(() {
      calculator.onButtonPress(button);
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
                    color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.fromLTRB(0, 30, 10, 10),
                            child: Text(calculator.output,
                                style:  TextStyle(
                                  fontSize: calculator.outputSize,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ))),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(calculator.result,
                              style: TextStyle(
                                fontSize: calculator.resultSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
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
                                  child: NewButton(
                                      Button.ac.text(),
                                      () => onButtonPress(Button.ac),
                                      Colors.red)),
                              Flexible(
                                  child: NewButton(
                                      Button.del.text(),
                                      () => onButtonPress(Button.del),
                                      Colors.redAccent)),
                              Flexible(
                                  child: NewButton(
                                      Button.percent.text(),
                                      () => onButtonPress(Button.percent),
                                      Colors.white54)),
                              Flexible(
                                  child: NewButton(
                                      Button.divide.text(),
                                      () => onButtonPress(Button.divide),
                                      Colors.white54)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child: NewButton(
                                      Button.seven.text(),
                                      () => onButtonPress(Button.seven),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.eight.text(),
                                      () => onButtonPress(Button.eight),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.nine.text(),
                                      () => onButtonPress(Button.nine),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.multiply.text(),
                                      () => onButtonPress(Button.multiply),
                                      Colors.white54)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child: NewButton(
                                      Button.four.text(),
                                      () => onButtonPress(Button.four),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.fifth.text(),
                                      () => onButtonPress(Button.fifth),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.six.text(),
                                      () => onButtonPress(Button.six),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.substract.text(),
                                      () => onButtonPress(Button.substract),
                                      Colors.white54)),
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  child: NewButton(
                                      Button.one.text(),
                                      () => onButtonPress(Button.one),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.two.text(),
                                      () => onButtonPress(Button.two),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.three.text(),
                                      () => onButtonPress(Button.three),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.sum.text(),
                                      () => onButtonPress(Button.sum),
                                      Colors.white54)),
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
                                  child: NewButton(
                                      Button.zero.text(),
                                      () => onButtonPress(Button.zero),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.dot.text(),
                                      () => onButtonPress(Button.dot),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      Button.result.text(),
                                      () => onButtonPress(Button.result),
                                      Colors.blue)),
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
