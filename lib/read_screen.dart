import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_figma_test/fake_italian_lesson.dart';
import 'package:flutter_figma_test/italian_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({Key? key}) : super(key: key);

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final List<Item> _data = generateItems(8);
  final ialianLesson = italianLessons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        //   expandedHeight: 73,
        backgroundColor: Colors.amber,
        //pinned: false,
        //  floating: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(25, 4, 18, 1)),
        flexibleSpace: Text('Read screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 426,
              height: 275,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      top: 90,
                      left: 0,
                      child: Container(
                          width: 426,
                          height: 185,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(164, 171, 189, 1),
                          ))),
                  Positioned(
                      top: 0,
                      left: 109,
                      child: Container(
                          width: 138,
                          height: 180,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 138,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      border: Border.all(
                                        color: Color.fromRGBO(51, 51, 51, 1),
                                        width: 0.5,
                                      ),
                                    ))),
                            Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                    width: 122,
                                    height: 164,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Rectangle3772.png'),
                                          fit: BoxFit.fitWidth),
                                    ))),
                          ]))),
                  const Positioned(
                      top: 193,
                      left: 56,
                      child: Text(
                        'Սբ. Թերեզա Հիսուս Մանկան (1873-1897)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(25, 4, 18, 1),
                            fontSize: 12,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  const Positioned(
                    top: 229,
                    left: 76,
                    child: Text(
                      'ԵՐԳԵԼ ՏԻՐՈՋ ՈՂՈՐՄՈՒԹՅՈՒՆԸ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(25, 4, 18, 1),
                          fontSize: 12,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: Color.fromRGBO(246, 246, 246, 1),
                width: double.infinity,
                height: 49,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        print('kisvel');
                      },
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          SvgPicture.asset('assets/images/այքըններ.svg'),
                          const SizedBox(width: 6),
                          const Text('Կիսվել')
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print('share anel paterin');
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/images/վելացնել1.svg'),
                          const SizedBox(width: 6),
                          const Text('Կիսվել'),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 14),
            const Center(
                child: Text(
              'Բովանդակություն',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1),
            )),
            const SizedBox(height: 20),
            ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      color: Color.fromRGBO(226, 224, 224, 1),
                    ),
                itemCount: 6,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    collapsedIconColor: const Color.fromRGBO(250, 147, 114, 1),
                    iconColor: const Color.fromRGBO(250, 147, 114, 1),
                    title: const Text('Animal'),
                    children: [
                      Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return ExpansionTile(
                                collapsedIconColor:
                                    const Color.fromRGBO(250, 147, 114, 1),
                                iconColor:
                                    const Color.fromRGBO(250, 147, 114, 1),
                                title: const Text('shunik'),
                                children: [
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                              title:
                                                  Text("indexInside: $index"));
                                        }),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }

  List<ExpansionTile> _buildPanel() {
    return _data.map<ExpansionTile>((Item item) {
      return ExpansionTile(
          collapsedIconColor: Color.fromRGBO(250, 147, 114, 1),
          iconColor: Color.fromRGBO(250, 147, 114, 1),
          title: Text(
            ialianLesson.first.title,
          ));
    }).toList();
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    // this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  // bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '${italianLessons.first.title} ,',
      expandedValue: 'This is item number $index',
    );
  });
}
