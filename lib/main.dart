import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calc_button.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(convertToEng(_expression));

    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
      var data = convertToBeng(_expression.toString());
      _expression = data;
      // convert double to int
      if (_expression.contains('.')) {
        _expression = _expression.substring(0, _expression.indexOf('.'));
      }
    });
  }

// convert bengali numbers to english and make a calculator
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '৳ $_expression',
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: allClear,
                  ),
                  CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: clear,
                  ),
                  CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: numClick,
                  ),
                  CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '৭',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '৮',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '৯',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    textSize: 24,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '৪',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '৫',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '৬',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    textSize: 38,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '১',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '২',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '৩',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    textSize: 30,
                    callback: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: '.',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '০',
                    callback: numClick,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '০০',
                    callback: numClick,
                    textSize: 26,
                    fillColor: 0xFF151A31,
                  ),
                  CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
