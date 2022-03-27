import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DictionaryArmItl extends StatefulWidget {
  const DictionaryArmItl({Key? key}) : super(key: key);

  @override
  _DictionaryArmItlState createState() => _DictionaryArmItlState();
}

class _DictionaryArmItlState extends State<DictionaryArmItl>
    with SingleTickerProviderStateMixin {
  //late TabController _controller;

  @override
  void initState() {
    // _controller = TabController(length: 10, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              title: Text(
                'Հայերեն-իտալերենարան',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1,
                    color: Color.fromRGBO(122, 108, 115, 1)),
              ),
              expandedHeight: 73,
              // backgroundColor: Colors.white,
              floating: true,
              primary: true,
              pinned: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color.fromRGBO(25, 4, 18, 1)),
            ),
            SliverFillRemaining(
              child: DefaultTabController(
                length: wordsArm.length,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0.0,
                    toolbarHeight: 11,
                    backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
                    bottom: TabBar(
                        indicatorWeight: 2,
                        unselectedLabelColor:
                            const Color.fromRGBO(122, 108, 115, 1),
                        labelColor: const Color.fromRGBO(251, 196, 102, 1),
                        indicatorColor: Colors.amber,
                        //  controller: _controller,
                        isScrollable: true,
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        tabs: wordsArm
                            .map((tabName) => Tab(
                                    child: Text(
                                  tabName,
                                  style: const TextStyle(
                                      fontFamily: 'ArshaluyseArtU',
                                      fontSize: 20,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                )))
                            .toList()),
                  ),
                  body: TabBarView(
                    children: wordsArm
                        .map((e) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ExpansionTile(
                              textColor: Color.fromRGBO(251, 196, 102, 1),
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: SvgPicture.asset(
                                    'assets/images/vector.svg'),
                              ),
                              title: Text(
                                "Արարիչ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              initiallyExpanded: false,
                              children: [
                                ListTile(
                                  tileColor: Color.fromRGBO(246, 246, 246, 1),
                                  title: Text(
                                      '1. Տեղափոխել ավելի վար, իջեցնել. abbassare il quadro – նկարը ներքև իջեցնել; abbassare la lampada – կանթեղը վար իջեցնել; ցածրացնել, ավելի ցածր մակարդակի բերել. abbassare il muro della casa – ցածրացնել տան պատը; abbassare l’altezza della finestra – ցածրացնել պատուհանի բարձրությունը; ավելի ցածր տոնայնության, աստիճանի, ուժգնության բերել, մեղմացնել, նվազեցնել. abbassare la voce (o il tono della voce) – ձայնը (կամ ձայնի տոնայնությունը) իջեցնել, մեղմել; abbassare la radio – ռա'),
                                ),
                              ],
                            )))
                        .toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArmenianItalian extends StatelessWidget {
  const ArmenianItalian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: GridView.count(
          mainAxisSpacing: 30,
          crossAxisCount: 7,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(wordsArm.length, (index) {
            return Center(
              child: InkWell(
                onTap: () {
                  print('hi');
                },
                child: Text(
                  '${wordsArm[index]}',
                  style: const TextStyle(
                      fontFamily: 'ArshaluyseArtU',
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

List<String> wordsArm = [
  'ա',
  "բ",
  "գ",
  "դ",
  "ե",
  "զ",
  "է",
  "ը",
  "թ",
  "ժ",
  "ի",
  "լ",
  "խ",
  "ծ",
  "կ",
  "հ",
  "ձ",
  "ղ",
  "ճ",
  "մ",
  "յ",
  "ն",
  "շ",
  "ո",
  "չ",
  "պ",
  "ջ",
  "ռ",
  "ս",
  "վ",
  "տ",
  "ր",
  "ց",
  "ու",
  "փ",
  "ք",
  "ԵՎ",
  "Օ",
  "Ֆ"
];
List<String> wordsIt = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  '',
  'V',
  'W',
  'X',
  'Y',
  'Z',
];

class ItalianArmenian extends StatelessWidget {
  const ItalianArmenian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: GridView.count(
          mainAxisSpacing: 30,
          crossAxisCount: 7,
          physics: NeverScrollableScrollPhysics(),
          children: List.generate(wordsIt.length, (index) {
            return Center(
              child: InkWell(
                onTap: () {
                  print('hi');
                },
                child: Text(
                  '${wordsIt[index]}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rye(
                      fontSize: 20,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
