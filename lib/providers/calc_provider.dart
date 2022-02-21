import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcProvider extends ChangeNotifier {
  String history = '';
  String expression = '';

  String convertToEng(String bengali) {
    String english = '';
    for (int i = 0; i < bengali.length; i++) {
      switch (bengali[i]) {
        case '০':
          english += '0';
          break;
        case '১':
          english += '1';
          break;
        case '২':
          english += '2';
          break;
        case '৩':
          english += '3';
          break;
        case '৪':
          english += '4';
          break;
        case '৫':
          english += '5';
          break;
        case '৬':
          english += '6';
          break;
        case '৭':
          english += '7';
          break;
        case '৮':
          english += '8';
          break;
        case '৯':
          english += '9';
          break;
        default:
          english += bengali[i];
      }
    }
    return english;
  }

// convert total result to bengali
  String convertToBeng(String english) {
    String bengali = '';
    for (int i = 0; i < english.length; i++) {
      switch (english[i]) {
        case '0':
          bengali += '০';
          break;
        case '1':
          bengali += '১';
          break;
        case '2':
          bengali += '২';
          break;
        case '3':
          bengali += '৩';
          break;
        case '4':
          bengali += '৪';
          break;
        case '5':
          bengali += '৫';
          break;
        case '6':
          bengali += '৬';
          break;
        case '7':
          bengali += '৭';
          break;
        case '8':
          bengali += '৮';
          break;
        case '9':
          bengali += '৯';
          break;
        default:
          bengali += english[i];
      }
    }
    return bengali;
  }

  clear(String text) {
    expression = '';
    notifyListeners();
  }

  allClear(String text) {
    history = '';
    expression = '';
    notifyListeners();
  }

  numClick(String text) {
    expression += text;
    notifyListeners();
  }

  evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(convertToEng(expression));

    ContextModel cm = ContextModel();

    history = expression;
    expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    var data = convertToBeng(expression.toString());
    expression = data;
    // convert double to int
    if (expression.contains('.')) {
      expression = expression.substring(0, expression.indexOf('.'));
    }
    notifyListeners();
  }
}
