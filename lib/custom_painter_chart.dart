import 'package:flutter/material.dart';
import 'package:ui_percent_indicator/circle_progress.dart';
import 'package:ui_percent_indicator/home_page.dart';

class CustomPainterChart extends StatefulWidget {
  const CustomPainterChart({Key? key}) : super(key: key);

  @override
  State<CustomPainterChart> createState() => _CustomPainterChartState();
}

class _CustomPainterChartState extends State<CustomPainterChart>
    with SingleTickerProviderStateMixin {

  late AnimationController _animatedController;
  late Animation<double> _animation;

  // 데이터 테이블의 수치를 가져온다. int 값
  final maxProgress = 90.0;

  @override
  void initState() {
    _animatedController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _animation =
        Tween<double>(begin: 0, end: maxProgress).animate(_animatedController)
          ..addListener(() {
            setState(() {
              // animationAction();
            });
          });
    super.initState();
  }

  void animationAction() {
    _animatedController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Circle Progress Indicator Painter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              foregroundPainter: CircleProgress(_animation.value),
              child: Container(
                width: 300,
                height: 300,
                child: GestureDetector(
                  onTap: (){
                    if (_animation.value == maxProgress){
                      _animatedController.reverse();
                    } else {
                      _animatedController.forward();
                    }
                  },
                  child: Center(
                    child: Text(
                      // data의 수치 호출 : sajuData[index].love..
                      '${_animation.value.toInt()}',
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
              indent: 100,
              endIndent: 100,
              color: Colors.red,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder:(context) => const HomePage()),
              );
            }, child: Text('To Home'),),
          ],
        ),
      ),
    );
  }
}
