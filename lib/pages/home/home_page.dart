import 'package:flutter/material.dart';
import 'package:water_count_app/pages/home/components/daily_progress_water.dart';
import 'package:water_count_app/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.waterGet();

    controller.containerHeightCalculator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B2C56),
      body: FutureBuilder(
        future: controller.initPage(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meta diária : ${controller.dailyGoal} L',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              DailyProgressWater(
                percentText: '${controller.percent}%',
                height: controller.containerHeight,
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/addWater');
          await controller.waterGet();
          controller.containerHeightCalculator();

          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
