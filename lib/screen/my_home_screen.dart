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
        title: Text(widget.title),
      ),
      body: SizedBox(
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Ingresar el número',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
              },
            ),
          ),
          keyboardType: TextInputType.number,
          onSubmitted: (value) {
          },
        ),
      ),
    );
  }
}
