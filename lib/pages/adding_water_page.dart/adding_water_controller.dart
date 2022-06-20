import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddingWaterController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController addWaterEC = TextEditingController();
  final TextEditingController dailyGoalEC = TextEditingController();
  int waterCount = 0;
  double dayGoalInLiters = 0;
  double dayGoalInMl = 0;
  double percent = 20;
  CollectionReference fireBaseRef =
      FirebaseFirestore.instance.collection('waterCount');

  Future<void> waterGet() async {
    var docGet = await fireBaseRef.doc('waterCount').get();
    dayGoalInLiters = await docGet.get('dailyGoalInLiters');
    percent = await docGet.get('percent');
    waterCount = await docGet.get('dailyWater');
    dayGoalInMl = await docGet.get('dailyGoalInMl');
  }

  Future<void> addWater() async {
    final formValid = formKey.currentState?.validate() ?? false;

    if (formValid) {
      int newValue = int.parse(addWaterEC.text);
      waterCount = waterCount + newValue;

      if (dailyGoalEC.text != '0' && dailyGoalEC.text != '') {
        dayGoalInMl = double.parse(dailyGoalEC.text);
      }
      if (dayGoalInMl > 0) {
        dayGoalInLiters = dayGoalInMl / 1000;
        percent = waterCount * 100 / dayGoalInMl;
      }
    }
  }

  Future<void> setWater() async {
    fireBaseRef.doc('waterCount').set(
      {
        'dailyWater': waterCount,
        'dailyGoalInLiters': dayGoalInLiters,
        'percent': percent,
        'dailyGoalInMl': dayGoalInMl,
      },
    );
  }
}
