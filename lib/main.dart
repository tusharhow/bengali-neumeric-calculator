import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/calc_provider.dart';
import 'views/cal_page.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CalcProvider>(
          create: (_) => CalcProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'NimuCalc',
        home: CalcPage(),
      ),
    );
  }
}
