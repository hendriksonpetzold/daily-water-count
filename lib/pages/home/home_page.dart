import 'package:flutter/material.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2B2C56),
      body: FutureBuilder(
        future: controller.initPage(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Meta diária : ${controller.dayGoal} L',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: size.width * .3,
                  height: size.height * .4,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: controller.containerHeight,
                          color: const Color(0xff3B6ABA).withOpacity(.8),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${controller.percent}%',
                          style: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
