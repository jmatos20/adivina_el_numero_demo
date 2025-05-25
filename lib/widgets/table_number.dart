import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumberTable extends ConsumerStatefulWidget {
  final String titulo;
  final List<int> items;
  final Map<int, bool>? numberStatus;

  const NumberTable({
    super.key,
    required this.titulo,
    required this.items,
    this.numberStatus,
  });

  @override
  ConsumerState<NumberTable> createState() => _NumberTableState();
}

class _NumberTableState extends ConsumerState<NumberTable> {
  @override
  Widget build(BuildContext context) {
    final hasStatus = widget.numberStatus != null;

    return Container(
      width: 100,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(widget.titulo),
          Expanded(
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (context, index) {
                final number = widget.items[index];
                final isCorrect = hasStatus ? widget.numberStatus![number] ?? false : null;

                return Text(
                  number.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: hasStatus 
                        ? (isCorrect! ? Colors.green : Colors.red) 
                        : Colors.black,
                    fontWeight: hasStatus ? FontWeight.bold : FontWeight.normal,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}