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
  String _output = '0';
  String _operand = '';
  String result = '0';
  double _a = 0.0;
  double _b = 0.0;
  double outputSize = 75.0;
  double resultSize = 60.0;

  Future<String> sleepOutput() {
    return Future<String>.delayed(
        const Duration(seconds: 3), () => output );
  }

  void onButtonPress(Button buttonText) async {
    switch (buttonText) {
      case Button.zero:
      case Button.one:
      case Button.two:
      case Button.three:
      case Button.four:
      case Button.fifth:
      case Button.six:
      case Button.seven:
      case Button.eight:
      case Button.nine:
        if (output == '0') {
          output = '';
        }
        await sleepOutput();
        output = output + buttonText.text();
        print(output);
        _output = _output + buttonText.text();
        break;
      case Button.dot:
        if (output.contains(Button.dot.text())) {
          return;
        }
        outputSize = 75.0;
        resultSize = 60.0;
        output = output + buttonText.text();
        _output = _output + buttonText.text();
        break;
      case Button.sum:
      case Button.substract:
      case Button.multiply:
      case Button.divide:
      case Button.percent:
        outputSize = 75.0;
        resultSize = 60.0;
        _a = double.parse(_output);
        _operand = buttonText.text();
        output = '0';
        _output = '0';
        break;
      case Button.result:
        outputSize = 60.0;
        resultSize = 75.0;
        _b = double.parse(_output);
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
        _output = '0';
        _operand = '';
        break;
      case Button.ac:
        outputSize = 75.0;
        resultSize = 60.0;
        output = '0';
        result = '0';
        _operand = '0';
        _a = 0;
        _b = 0;
        break;
      case Button.del:
        outputSize = 75.0;
        resultSize = 60.0;
        output = output.substring(0, output.length - 1);
        if (output == '') {
          output = '0';
        }
        break;
    }
  }
}
