import 'simple_calc.dart';

class MyCalculator extends SimpleCalc {

  double memory = 0.0;
  double result = 0.0;

  @override
  double sum(double a, double b) => a + b;

  @override
  double substract(double a, double b) => a - b;

  @override
  double multiply(double a, double b) => a * b;

  @override
  double divide(double a, double b) => a / b;

  @override
  double interest(double a, double b) => a % b;

}