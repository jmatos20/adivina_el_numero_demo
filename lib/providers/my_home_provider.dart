import 'package:flutter_riverpod/flutter_riverpod.dart';

final numeroAleatorioProvider = StateProvider((ref) => 0);
final intentosProvider = StateProvider((ref) => 5);
final dificultadProvider = StateProvider((ref) => 0);
final maxProvider = StateProvider((ref) => 10);
final intentoRespaldosProvider = StateProvider((ref) => 5);
final numberInputProvider = StateProvider((ref) => null);
final historyProvider = StateProvider<Map<int, bool>>((ref) => {});
final menorQueListProvider = StateProvider<List<int>>((ref) => []);
final mayorQueListProvider = StateProvider<List<int>>((ref) => []);


