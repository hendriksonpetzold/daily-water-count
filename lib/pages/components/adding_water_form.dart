import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class AddingWaterForm extends StatelessWidget {
  final TextEditingController? dailyGoalController;
  final TextEditingController? addWaterController;

  const AddingWaterForm({
    Key? key,
    this.dailyGoalController,
    this.addWaterController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: dailyGoalController,
            style: const TextStyle(color: Colors.white),
            validator: Validatorless.number('Somente números'),
            decoration: const InputDecoration(
              label: Text(
                'Adicione sua meta em ml',
                style: TextStyle(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: TextFormField(
            controller: addWaterController,
            style: const TextStyle(color: Colors.white),
            validator: Validatorless.multiple(
              [
                Validatorless.required('Valor Obrigatório'),
                Validatorless.number('Adicione somente numeros')
              ],
            ),
            decoration: const InputDecoration(
              label: Text(
                'Adicione água em ml',
                style: TextStyle(color: Colors.white),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
