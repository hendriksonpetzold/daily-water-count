import 'package:flutter/material.dart';

import 'package:validatorless/validatorless.dart';
import 'package:water_count_app/pages/ading_water_page.dart/adding_water_controller.dart';

class AddingWaterPage extends StatefulWidget {
  const AddingWaterPage({Key? key}) : super(key: key);

  @override
  State<AddingWaterPage> createState() => _AddingWaterPageState();
}

class _AddingWaterPageState extends State<AddingWaterPage> {
  final AddingWaterController controller = AddingWaterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B2C56),
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .26,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: controller.dayGoalEC,
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
                controller: controller.addWaterEC,
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
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: InkWell(
                onTap: () async {
                  await controller.waterGet();
                  await controller.addWater();
                  controller.setWater();
                },
                child: Container(
                  height: 40,
                  color: const Color(0xff3B6ABA).withOpacity(.8),
                  child: const Center(
                    child: Text(
                      'Adicionar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
