import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_figma_test/dictionary.dart';
import 'package:flutter_figma_test/italian_model.dart';
import 'package:flutter_figma_test/read_screen.dart';
import 'dart:math' as math;

import 'contact.dart';
import 'diconary_armenian_italian.dart';
import 'fake_italian_lesson.dart';
import 'italian_lesson_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const Contact(),
    );
  }
}

class CreateItem extends StatefulWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  State<CreateItem> createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  final GlobalKey<SliverAnimatedListState> _listKey = GlobalKey();
  List<IalianLesson> lessons = [];
  final itali = italianLessons;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    for (var item in itali) {
      await Future.delayed(const Duration(milliseconds: 500));

      lessons.add(item);

      _listKey.currentState?.insertItem(lessons.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 73,
            backgroundColor: Colors.white,
            pinned: false,
            floating: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color.fromRGBO(25, 4, 18, 1)),
            flexibleSpace: Text('Italian daser'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(15.0),
            sliver: SliverAnimatedList(
              key: _listKey,
              itemBuilder: (BuildContext context, int index, animation) {
                final IalianLesson italianLesson = lessons[index];

                if (index % 2 != 0) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0),
                      end: const Offset(0, 0),
                    ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.bounceIn,
                        reverseCurve: Curves.bounceOut)),
                    child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ITLesson(
                            isOdd: true,
                            italianLesson: italianLesson,
                          ),
                        )),
                  );
                } else {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 0),
                      end: const Offset(0, 0),
                    ).animate(CurvedAnimation(
                        parent: animation,
                        curve: Curves.bounceIn,
                        reverseCurve: Curves.bounceOut)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ITLesson(
                        isOdd: false,
                        italianLesson: italianLesson,
                      ),
                    ),
                  );
                }
              },
              initialItemCount: lessons.length,
            ),
          ),
        ],
      ),
    );
  }
}
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: 288,
//         height: 169,
//         child: Stack(children: <Widget>[
//           Positioned(
//               top: 147,
//               left: 0,
//               child: Container(
//                   width: 288,
//                   height: 8,
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(122, 108, 115, 1),
//                   ))),
//           Positioned(
//               top: 155,
//               left: 0,
//               child: SizedBox(
//                   width: 288,
//                   height: 14,
//                   child: Stack(children: <Widget>[
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       child: SvgPicture.asset('assets/images/group5040.svg',
//                           semanticsLabel: 'group5040'),
//                     ),
//                   ]))),
//           Positioned(
//               top: 0,
//               left: 14,
//               child: Container(
//                   width: 116,
//                   height: 148,
//                   decoration: const BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                           color:
//                               Color.fromRGBO(31, 31, 31, 0.10000000149011612),
//                           offset: Offset(4, -4),
//                           blurRadius: 1)
//                     ],
//                     color: Color.fromRGBO(164, 171, 189, 1),
//                   ))),
//           Positioned(
//               top: 17,
//               left: 26,
//               child: Container(
//                   width: 91,
//                   height: 113,
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: const Color.fromRGBO(255, 255, 255, 1),
//                       width: 0.5,
//                     ),
//                   ))),
//           Positioned(
//               top: 21.0,
//               left: 30,
//               child: Container(
//                   width: 83,
//                   height: 104.0,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(
//                           'assets/images/mage.png',
//                         ),
//                         fit: BoxFit.fitWidth),
//                   ))),
//           Positioned(
//               top: 136,
//               left: 199,
//               child: Transform.rotate(
//                 angle: 0.5 * (math.pi / 180),
//                 child: SvgPicture.asset(
//                   'assets/images/vector81.svg',
//                   // semanticsLabel: 'vector81',
//                 ),
//               )),
//           const Positioned(
//               top: 0,
//               left: 141,
//               child: Text(
//                 'Սբ. Թերեզա Հիսուս\n Մանկան (1873-1897)',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Color.fromRGBO(25, 4, 18, 1),
//                     fontSize: 12,
//                     letterSpacing: 0,
//                     fontWeight: FontWeight.normal,
//                     height: 1),
//               )),
//           const Positioned(
//               top: 60,
//               left: 139,
//               child: Text(
//                 'ԵՐԳԵԼ ՏԻՐՈՋ \nՈՂՈՐՄՈՒԹՅՈՒՆԸ',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     color: Color.fromRGBO(25, 4, 18, 1),
//                     fontSize: 12,
//                     letterSpacing: 0,
//                     fontWeight: FontWeight.normal,
//                     height: 1),
//               )),
//         ]));
//   }
// }
