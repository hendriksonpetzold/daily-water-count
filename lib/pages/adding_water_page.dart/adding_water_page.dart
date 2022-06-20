import 'package:flutter/material.dart';

import 'package:validatorless/validatorless.dart';
import 'package:water_count_app/pages/adding_water_page.dart/adding_water_controller.dart';
import 'package:water_count_app/pages/components/add_button.dart';
import 'package:water_count_app/pages/components/adding_water_form.dart';

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
            AddingWaterForm(
              dailyGoalController: controller.dailyGoalEC,
              addWaterController: controller.addWaterEC,
            ),
            AddButton(
              onPressed: () async {
                await controller.waterGet();
                await controller.addWater();
                controller.setWater();
              },
            ),
          ],
        ),
      ),
    );
  }
}
