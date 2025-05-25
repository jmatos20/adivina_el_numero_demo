import 'package:adivina_el_numero_demo/widgets/input_number.dart';
import 'package:adivina_el_numero_demo/widgets/table_number.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key, required this.title});
  final String title;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  centerTitle: true, 
  title: Text(widget.title),
),
      body: Column(
        children: [
          Container(
            margin:EdgeInsets.only(top: 30,bottom: 30),
            
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              SizedBox(
                width: 200,
                child: InputNumber()),
              Column(
                children: [Text("Intentos"),Text("1")],
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberTable(titulo: "mayor que", items: [1, 2, 3, 4, 5, 6]),
              NumberTable(titulo: "menor que", items: [1, 2, 3, 4, 5, 6]),
              NumberTable(
                titulo: "Historial",
                items: [1, 2, 3],
                numberStatus: {1: true, 3: false},
              ),
              Container()
            ],
          ),
        ],
      ),
    );
  }
}
