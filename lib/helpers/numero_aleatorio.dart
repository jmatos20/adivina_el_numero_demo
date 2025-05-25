import 'dart:math';

import 'package:adivina_el_numero_demo/providers/my_home_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void numeroRandom({required ref, required int max,required int intento}) {
  final random = Random();
  final newValue = random.nextInt(max) + 1;
  print("el valoooor random es $newValue");
  ref.read(numeroAleatorioProvider.notifier).update((state) => newValue);
  ref.read(maxProvider.notifier).update((state) => max);
  ref.read(intentoRespaldosProvider.notifier).update((state) => intento);
}