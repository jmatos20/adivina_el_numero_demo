import 'package:adivina_el_numero_demo/helpers/reinicio.dart';
import 'package:adivina_el_numero_demo/providers/my_home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputNumber extends ConsumerStatefulWidget {
  const InputNumber({super.key});

  @override
  ConsumerState<InputNumber> createState() => _InputNumberState();
}

class _InputNumberState extends ConsumerState<InputNumber> {
  final _formKey = GlobalKey<FormBuilderState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorderBlue = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
    );

    OutlineInputBorder outlineInputBorderGris = OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    );

    TextStyle textStyle = TextStyle(
      color: Colors.lightBlue,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    EdgeInsets paddingInput = EdgeInsets.symmetric(horizontal: 12, vertical: 8);

    OutlineInputBorder outlineInputBorderRadius = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    );

    return FormBuilder(
      key: _formKey,
      child: FormBuilderTextField(
        name: 'numero_ingresado',
        focusNode: _focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        textInputAction: TextInputAction.done,
        onEditingComplete: () {
          _focusNode.requestFocus();
          _formKey.currentState?.save();

          final numero =_formKey.currentState?.value['numero_ingresado'];
          final numeroIngresado = int.tryParse(numero);
          int numeroAleatorio = ref.watch(numeroAleatorioProvider);
          int intentosRealizados = ref.watch(intentosProvider);

  


          if (numeroIngresado == numeroAleatorio) {
           ref.read(historyProvider.notifier).update((state) => {...state, ?numeroIngresado: true});
             ref.read(mayorQueListProvider.notifier).update((state) => []);
      ref.read(menorQueListProvider.notifier).update((state) => []);
        reinicioValores(ref: ref);

          } else if (numeroIngresado! > numeroAleatorio) {
            ref
                .read(mayorQueListProvider.notifier)
                .update((state) => [...state, numeroIngresado]);
          } else {
            ref
                .read(menorQueListProvider.notifier)
                .update((state) => [...state, numeroIngresado]);
          }


          if (numeroIngresado != numeroAleatorio) {
            ref.read(intentosProvider.notifier).update((state) => state - 1);
          }


          if (intentosRealizados <= 0 &&
              numeroIngresado != numeroAleatorio) {
                 ref.read(historyProvider.notifier).update((state) => {...state, ?numeroIngresado: false});
                   ref.read(mayorQueListProvider.notifier).update((state) => []);
      ref.read(menorQueListProvider.notifier).update((state) => []);

      reinicioValores(ref: ref);
          }

          _formKey.currentState?.reset();
          FocusScope.of(context).unfocus();
        },
        style: textStyle,
        decoration: InputDecoration(
          labelText: 'Numbers',
          hintText: "###",
          hintStyle: TextStyle(color: Colors.grey[400]),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          focusedBorder: outlineInputBorderBlue,
          enabledBorder: outlineInputBorderGris,
          contentPadding: paddingInput,
          border: outlineInputBorderRadius,
        ),
      ),
    );
  }
}
