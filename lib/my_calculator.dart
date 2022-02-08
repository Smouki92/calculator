import 'simple_calc.dart';

enum Button {
  ac,
  del,
  percent,
  divide,
  multiply,
  substract,
  sum,
  result,
  dot,
  zero,
  one,
  two,
  three,
  four,
  fifth,
  six,
  seven,
  eight,
  nine
}

extension ButtonText on Button {
  String text() {
    switch (this) {
      case Button.ac:
        return 'AC';
      case Button.del:
        return '⌫';
      case Button.percent:
        return '%';
      case Button.divide:
        return '÷';
      case Button.multiply:
        return '×';
      case Button.substract:
        return '-';
      case Button.sum:
        return '+';
      case Button.result:
        return '=';
      case Button.dot:
        return '.';
      case Button.zero:
        return '0';
      case Button.one:
        return '1';
      case Button.two:
        return '2';
      case Button.three:
        return '3';
      case Button.four:
        return '4';
      case Button.fifth:
        return '5';
      case Button.six:
        return '6';
      case Button.seven:
        return '7';
      case Button.eight:
        return '8';
      case Button.nine:
        return '9';
    }
  }
}

class MyCalculator extends SimpleCalc {
  @override
  double sum(double a, double b) => a + b;

  @override
  double substract(double a, double b) => a - b;

  @override
  double multiply(double a, double b) => a * b;

  @override
  double divide(double a, double b) => a / b;

  @override
  double percent(double a, double b) => (a * b) / 100;

  String output = '0';
  String result = '0';
  double outputSize = 60.0;
  double resultSize = 75.0;
  double _a = 0.0;
  double _b = 0.0;
  String _operand = '';

  void onButtonPress(Button buttonText) {
    if (buttonText == Button.ac) {
      output = '0';
      result = '0';
      outputSize = 60.0;
      resultSize = 75.0;
      _a = 0;
      _b = 0;
      _operand = '';
    } else if (buttonText == Button.del) {
      outputSize = 75.0;
      resultSize = 60.0;
      output = output.substring(0, output.length - 1);
      if (output == '') {
        output = '0';
      }
    } else if (buttonText == Button.dot) {
      outputSize = 75.0;
      resultSize = 60.0;
      output = output + buttonText.text();
    } else if (buttonText == Button.sum ||
        buttonText == Button.substract ||
        buttonText == Button.multiply ||
        buttonText == Button.divide ||
        buttonText == Button.percent) {
      _a = double.parse(output);
      _operand = buttonText.text();
      output = '0';
    } else if (buttonText == Button.result) {
      outputSize = 60.0;
      resultSize = 75.0;
      _b = double.parse(output);
      if (_operand == Button.sum.text()) {
        result = (_a + _b).toString();
      }
      if (_operand == Button.substract.text()) {
        result = (_a - _b).toString();
      }
      if (_operand == Button.multiply.text()) {
        result = (_a * _b).toString();
      }
      if (_operand == Button.divide.text()) {
        result = (_a / _b).toString();
      }
      if (_operand == Button.percent.text()) {
        result = ((_a * _b) / 100).toString();
      }
      output = '0';
      _operand = '';
    } else {
      outputSize = 75.0;
      resultSize = 60.0;
      if (output == Button.zero.text()) {
        output = buttonText.text();
      } else {
        output = output + buttonText.text();
      }
    }
  }
}
