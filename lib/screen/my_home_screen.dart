import 'package:adivina_el_numero_demo/providers/my_home_provider.dart';
import 'package:adivina_el_numero_demo/widgets/input_number.dart';
import 'package:adivina_el_numero_demo/widgets/input_slider.dart';
import 'package:adivina_el_numero_demo/widgets/table_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomeScreen extends ConsumerStatefulWidget {
  const MyHomeScreen({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends ConsumerState<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    int intentos = ref.watch(intentosProvider);
    List<int> mayorQue = ref.watch(mayorQueListProvider);
    List<int> menorQue = ref.watch(menorQueListProvider);
    final numberStatus = ref.watch(historyProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 40),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                SizedBox(width: 200, child: InputNumber()),
                Column(children: [Text("Intentos"), Text(intentos.toString())]),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberTable(titulo: "mayor que", items: mayorQue),
              NumberTable(titulo: "menor que", items: menorQue),
              NumberTable(
                titulo: "Historial",
                items: numberStatus.keys.toList(), // Lista de números guardados
                numberStatus: numberStatus,
              ),
            ],
          ),
          InputSlider(),
        ],
      ),
    );
  }
}
