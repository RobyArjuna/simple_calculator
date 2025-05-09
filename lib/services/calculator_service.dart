import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart';

class CalculatorService {
  static List<String> history = [];
  static final operators = ['+', '-', '*', '/', '×', '÷'];
  static String appendInput(String current, String input) {
    if (current == '0') {
      if (operators.contains(input)) {
        return current;
      }
      return input;
    }
    if (current == 'Error') {
      if (operators.contains(input)) {
        return '0';
      }
      return input;
    }

    if (operators.contains(current.characters.last) &&
        operators.contains(input)) {
      current = current.substring(0, current.length - 1);
    }

    return current + input;
  }

  static String deleteLast(String current) {
    if (current.length <= 1) return '0';
    return current.substring(0, current.length - 1);
  }

  static String calculate(String expression) {
    try {
      String originalExpression = expression;
      expression = expression.replaceAll('×', '*').replaceAll('÷', '/');
      GrammarParser p = GrammarParser();
      Expression exp = p.parse(expression);
      double eval = exp.evaluate(EvaluationType.REAL, ContextModel());
      String result = formatNumber(eval);
      history.add('$originalExpression = $result');
      return result;
    } catch (e) {
      return 'Error';
    }
  }

  static String formatNumber(double value) {
    final formatter = NumberFormat('#,##0.##', 'id_ID');
    return formatter.format(value);
  }
}
