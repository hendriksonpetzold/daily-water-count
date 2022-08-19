import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  CollectionReference fireBaseRef =
      FirebaseFirestore.instance.collection('waterCount');
  double percent = 20;
  double dailyGoal = 0;
  double containerHeight = 200;

  Future<void> initPage() async {
    await waterGet();
    containerHeightCalculator();
  }

  double containerHeightCalculator() {
    containerHeight = percent * 3.2;
    return containerHeight;
  }

  Future<void> waterGet() async {
    var docGet = await fireBaseRef.doc('waterCount').get();
    dailyGoal = await docGet.get('dailyGoalInLiters');
    percent = await docGet.get('percent');
  }
}
