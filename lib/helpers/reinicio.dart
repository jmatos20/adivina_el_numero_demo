import 'dart:math';
import 'package:adivina_el_numero_demo/providers/my_home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void reinicioValores({required ref }) {
int intentos = ref.watch(intentoRespaldosProvider);
int max =  ref.watch(maxProvider);
  final random = Random();
  final newValue = random.nextInt(max) + 1;
  print("volvar a jugar con valor ramdom es $newValue");
  ref.read(numeroAleatorioProvider.notifier).update((state) => newValue);
  ref.read(maxProvider.notifier).update((state) => max);
  ref.read(intentosProvider.notifier).update((state) => intentos);
}