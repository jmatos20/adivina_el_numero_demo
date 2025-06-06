import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:adivina_el_numero_demo/screen/my_home_screen.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adivina el número',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const MyHomeScreen(title: 'Adivina el número'),
    );
  }
}


