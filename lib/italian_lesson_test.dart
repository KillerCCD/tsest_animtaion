import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'dart:math' as math;

import 'italian_model.dart';

// class TestAnimate extends StatefulWidget {
//   const TestAnimate({Key? key}) : super(key: key);

//   @override
//   State<TestAnimate> createState() => _TestAnimateState();
// }

// class _TestAnimateState extends State<TestAnimate>
//     with SingleTickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation animation;
//   @override
//   void initState() {
//     controller = AnimationController(
//       duration: const Duration(seconds: 10),
//       vsync: this,
//     );
//     controller..forward();
//     controller.addListener(() {
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: AnimatedBuilder(
//           animation: controller,
//           child: Container(
//             width: 200.0,
//             height: 200.0,
//             color: Colors.green,
//             child: const Center(
//               child: Text('Whee!'),
//             ),
//           ),
//           builder: (BuildContext context, Widget? child) {
//             return Transform.rotate(
//               angle: controller.value * 2.0 * math.pi,
//               child: child,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class ITLesson extends StatefulWidget {
  final IalianLesson italianLesson;
  final bool isOdd;
  const ITLesson({Key? key, required this.isOdd, required this.italianLesson})
      : super(key: key);

  @override
  _ItalianLessonState createState() =>
      // ignore: no_logic_in_create_state
      _ItalianLessonState(isOdd: isOdd, italianLesson: italianLesson);
}

class _ItalianLessonState extends State<ITLesson>
    with TickerProviderStateMixin {
  final IalianLesson italianLesson;
  final bool isOdd;

  _ItalianLessonState({required this.italianLesson, required this.isOdd});

  //crate animate controller
  late AnimationController _controller;

  double _widht = 0;
  double _imageWidth = 0;
  bool _visible = false;

  Animation? transitionAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {
              Future.delayed(const Duration(milliseconds: 500), () async {
                for (double i = 0; i < 406; i++) {
                  _widht = i;

                  if (_widht == 150) {
                    Future.delayed(const Duration(milliseconds: 250), () {
                      for (double j = 0; j < 224; j++) {
                        _imageWidth = j;
                      }
                    });
                  }
                }
                _visible = true;
              });
            });
          })
          ..forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // color: Colors.amber,
        width: 304,
        height: 168,
        child: Stack(children: <Widget>[
          Positioned(
              top: 36,
              left: 0,
              child: SizedBox(
                  width: 304,
                  height: 46,
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.decelerate,
                          child: Container(
                              width: _widht,
                              height: 46,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(84, 112, 126, 1),
                              )),
                        )),
                  ]))),
          Positioned(
            top: 0,
            left: 16,
            child: SizedBox(
                width: 220,
                height: 118,
                child: Transform.translate(
                  offset: Offset(0.0, 0.0),
                  child: Stack(children: <Widget>[
                    Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          color: Colors.amber,
                          width: 220,
                          height: 118,
                          // decoration: BoxDecoration(
                          //   color: const Color.fromRGBO(255, 255, 255, 1),
                          //   border: Border.all(
                          //     color: const Color.fromRGBO(25, 4, 18, 1),
                          //     width: 0.8,
                          //   ),
                          // )
                        )),
                    Positioned(
                        top: 4,
                        left: 4,
                        child: Container(
                            width: 212,
                            height: 110,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/Rectangle3789.png'),
                                  fit: BoxFit.fitWidth),
                            ))),
                  ]),
                )),
          ),
          Positioned(
              top: 128,
              left: 16,
              child: isOdd
                  ? Transform(
                      transform: Matrix4.rotationY(math.pi),
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Text(
                          italianLesson.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(84, 112, 126, 1),
                              fontFamily: 'GHEA Grapalat',
                              fontSize: 12,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.6),
                        ),
                      ))
                  : AnimatedOpacity(
                      opacity: _visible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        italianLesson.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Color.fromRGBO(84, 112, 126, 1),
                            fontFamily: 'GHEA Grapalat',
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.6),
                      ),
                    )),
          Positioned(
            top: 49,
            left: 259,
            child: isOdd
                ? Transform(
                    transform: Matrix4.rotationY(math.pi),
                    alignment: Alignment.center,
                    child: AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        child: Text(
                          italianLesson.number,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: Color.fromRGBO(226, 224, 224, 1),
                              fontFamily: 'GHEA Grapalat',
                              fontSize: 20,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        )))
                : AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      italianLesson.number,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromRGBO(226, 224, 224, 1),
                          fontFamily: 'GHEA Grapalat',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    )),
          ),
        ]));
  }
}
