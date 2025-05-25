import 'package:adivina_el_numero_demo/helpers/numero_aleatorio.dart';
import 'package:adivina_el_numero_demo/providers/my_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputSlider extends ConsumerStatefulWidget {
  const InputSlider({super.key});

  @override
  ConsumerState<InputSlider> createState() => _DifficultySliderState();
}

class _DifficultySliderState extends ConsumerState<InputSlider> {
  final _formKey = GlobalKey<FormBuilderState>();
  late String _difficultyLabel;

  @override
  void initState() {
    super.initState();
    _difficultyLabel = 'Fácil';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dificultadProvider.notifier).update((state) => 0);
      ref.read(intentosProvider.notifier).update((state) => 5);
      ref.read(mayorQueListProvider.notifier).update((state) => []);
      ref.read(menorQueListProvider.notifier).update((state) => []);
      numeroRandom(ref: ref, max: 10, intento: 5);
    });
  }

  void updateDifficultyLabel(double? value) {
    if (value == null) return;

    int dificultad = value.toInt();
    String nuevaDificultad;
    int intentos;

    // Configurar los valores según la dificultad seleccionada
    switch (dificultad) {
      case 0:
        nuevaDificultad = 'Fácil';
        intentos = 5;

        numeroRandom(ref: ref, max: 10, intento: intentos);

        break;
      case 1:
        nuevaDificultad = 'Medio';
        intentos = 8;
        numeroRandom(ref: ref, max: 20, intento: intentos);
        break;
      case 2:
        nuevaDificultad = 'Avanzado';
        intentos = 15;

        numeroRandom(ref: ref, max: 100, intento: intentos);
        break;
      case 3:
        nuevaDificultad = 'Extremo';
        intentos = 25;

        numeroRandom(ref: ref, max: 1000, intento: intentos);
        break;
      default:
        nuevaDificultad = 'Fácil';
        intentos = 5;
        numeroRandom(ref: ref, max: 10, intento: intentos);
    }

    setState(() {
      _difficultyLabel = nuevaDificultad;
    });

    ref.read(dificultadProvider.notifier).update((state) => dificultad);
    ref.read(intentosProvider.notifier).update((state) => intentos);
    ref.read(mayorQueListProvider.notifier).update((state) => []);
    ref.read(menorQueListProvider.notifier).update((state) => []);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      width: 350,
      height: 100,
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _difficultyLabel, // Título dinámico basado en la dificultad
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            FormBuilderSlider(
              name: 'dificultad',
              min: 0,
              max: 3,
              initialValue: 0, // Ahora empieza en "Fácil"
              divisions: 3,
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.grey[300],
              decoration: const InputDecoration(border: InputBorder.none),
              onChanged: updateDifficultyLabel,
              displayValues: DisplayValues.none,
            ),
          ],
        ),
      ),
    );
  }
}
