import 'package:flutter/material.dart';
import 'package:nimu_calc/views/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import '../providers/calc_provider.dart';

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
        title: 'Ekush Calculator',
        home: Splash(),
      ),
    );
  }
}
