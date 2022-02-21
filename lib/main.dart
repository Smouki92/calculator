import 'package:calculator/new_button.dart';
import 'package:flutter/material.dart';
import 'my_calculator.dart';

void main(){
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

  void onButtonPress(CalcButton button) async {
    final awaitOutput =  calculator.output;
    calculator.output = '';
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 100));
    calculator.output = awaitOutput;
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
                                style:  const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white54,
                                ))),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(calculator.mainOutput,
                              style: const TextStyle(
                                fontSize: 70,
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
                                      CalcButton.ac.text(),
                                      () => onButtonPress(CalcButton.ac),
                                      Colors.red)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.del.text(),
                                      () => onButtonPress(CalcButton.del),
                                      Colors.redAccent)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.percent.text(),
                                      () => onButtonPress(CalcButton.percent),
                                      Colors.white54)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.divide.text(),
                                      () => onButtonPress(CalcButton.divide),
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
                                      CalcButton.seven.text(),
                                      () => onButtonPress(CalcButton.seven),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.eight.text(),
                                      () => onButtonPress(CalcButton.eight),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.nine.text(),
                                      () => onButtonPress(CalcButton.nine),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.multiply.text(),
                                      () => onButtonPress(CalcButton.multiply),
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
                                      CalcButton.four.text(),
                                      () => onButtonPress(CalcButton.four),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.fifth.text(),
                                      () => onButtonPress(CalcButton.fifth),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.six.text(),
                                      () => onButtonPress(CalcButton.six),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.substract.text(),
                                      () => onButtonPress(CalcButton.substract),
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
                                      CalcButton.one.text(),
                                      () => onButtonPress(CalcButton.one),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.two.text(),
                                      () => onButtonPress(CalcButton.two),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.three.text(),
                                      () => onButtonPress(CalcButton.three),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.sum.text(),
                                      () => onButtonPress(CalcButton.sum),
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
                                      CalcButton.zero.text(),
                                      () => onButtonPress(CalcButton.zero),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.dot.text(),
                                      () => onButtonPress(CalcButton.dot),
                                      Colors.orange)),
                              Flexible(
                                  child: NewButton(
                                      CalcButton.result.text(),
                                      () => onButtonPress(CalcButton.result),
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
