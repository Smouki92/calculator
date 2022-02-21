import 'simple_calc.dart';

enum CalcButton {
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

extension ButtonText on CalcButton {
  String text() {
    switch (this) {
      case CalcButton.ac:
        return 'AC';
      case CalcButton.del:
        return '⌫';
      case CalcButton.percent:
        return '%';
      case CalcButton.divide:
        return '÷';
      case CalcButton.multiply:
        return '×';
      case CalcButton.substract:
        return '-';
      case CalcButton.sum:
        return '+';
      case CalcButton.result:
        return '=';
      case CalcButton.dot:
        return '.';
      case CalcButton.zero:
        return '0';
      case CalcButton.one:
        return '1';
      case CalcButton.two:
        return '2';
      case CalcButton.three:
        return '3';
      case CalcButton.four:
        return '4';
      case CalcButton.fifth:
        return '5';
      case CalcButton.six:
        return '6';
      case CalcButton.seven:
        return '7';
      case CalcButton.eight:
        return '8';
      case CalcButton.nine:
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

  String output = '';
  CalcButton? _operand;
  String mainOutput = '0';
  double _num1 = 0.0;
  double _num2 = 0.0;
  double bufResult = 0.0;

  void onButtonPress(CalcButton button) async {
    switch (button) {
      case CalcButton.zero:
      case CalcButton.one:
      case CalcButton.two:
      case CalcButton.three:
      case CalcButton.four:
      case CalcButton.fifth:
      case CalcButton.six:
      case CalcButton.seven:
      case CalcButton.eight:
      case CalcButton.nine:
        if (mainOutput == '0') {
          mainOutput = '';
        }
        mainOutput = mainOutput + button.text();
        break;
      case CalcButton.dot:
        if (mainOutput.contains(CalcButton.dot.text())) {
          return;
        }
        mainOutput = mainOutput + button.text();
        break;
      case CalcButton.sum:
      case CalcButton.substract:
      case CalcButton.multiply:
      case CalcButton.divide:
      case CalcButton.percent:
         if (_operand != null) {
           result(button);
         }
        _num1 = double.parse(mainOutput);
        _operand = button;
        output = mainOutput + ' ' + button.text();
        mainOutput = '0';
        break;
      case CalcButton.result:
        result(button);
        break;
      case CalcButton.ac:
        output = '';
        mainOutput = '0';
        _operand = null;
        _num1 = 0;
        _num2 = 0;
        break;
      case CalcButton.del:
        mainOutput = mainOutput.substring(0, mainOutput.length - 1);
        if (mainOutput == '') {
          mainOutput = '0';
        }
        break;
    }
  }

  void result(CalcButton button) {
    _num2 = double.parse(mainOutput);
    output = output + ' ' + mainOutput + ' ' + button.text();

    if (_operand == CalcButton.sum) {
      bufResult = _num1 + _num2;
    }
    if (_operand == CalcButton.substract) {
      bufResult = _num1 - _num2;
    }
    if (_operand == CalcButton.multiply) {
      bufResult = _num1 * _num2;
    }
    if (_operand == CalcButton.divide) {
      bufResult = _num1 / _num2;
    }
    if (_operand == CalcButton.percent) {
      bufResult = (_num1 * _num2) / 100;
    }
    if ((bufResult % 1) == 0) {
      mainOutput = bufResult.toInt().toString();
    } else {
      mainOutput = bufResult.toString();
    }
    _operand = null;
  }
}
