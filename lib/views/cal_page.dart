import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/calc_button.dart';
import '../providers/calc_provider.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF283637),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Consumer<CalcProvider>(builder: (context, value, _) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    value.history,
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF545F61),
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              );
            }),
            Consumer<CalcProvider>(builder: (context, value, _) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    value.expression.isEmpty ? '০' : value.expression,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: value.expression.isEmpty ? 55 : 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                alignment: const Alignment(1.0, 1.0),
              );
            }),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: 'AC',
                    fillColor: 0xFF6C807F,
                    textSize: 20,
                    callback: value.allClear,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: 'C',
                    fillColor: 0xFF6C807F,
                    callback: value.clear,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '%',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.numClick,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '/',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.numClick,
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৭',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৮',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৯',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '*',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.numClick,
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৪',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৫',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৬',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '-',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.numClick,
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '১',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '২',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '৩',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '+',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.numClick,
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '.',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '০',
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '০০',
                    textSize: 26,
                    callback: value.numClick,
                    fillColor: 0xFF151A31,
                  );
                }),
                Consumer<CalcProvider>(builder: (context, value, _) {
                  return CalcButton(
                    text: '=',
                    fillColor: 0xFFFFFFFF,
                    textColor: 0xff000000,
                    callback: value.evaluate,
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
