import 'package:flutter/material.dart';

class DailyProgressWater extends StatelessWidget {
  final double? height;
  final String percentText;
  const DailyProgressWater({Key? key, this.height, required this.percentText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .3,
        height: MediaQuery.of(context).size.height * .4,
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
                height: height,
                color: const Color(0xff3B6ABA).withOpacity(.8),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                percentText,
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
    );
  }
}
