import 'package:cubic_cal/widget/add.dart';
import 'package:cubic_cal/widget/details.dart';
import 'package:cubic_cal/widget/cubicCalulate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> category = [
    "All",
    "24 ↓",
    "24 ↑",
    "30 ↑",
    "36 ↑",
    "48 ↑",
    "60 ↑"
  ];

  final Map<String, List<String>> categorizedData = {
    "All": [],
    "24 ↓": [],
    "24 ↑": [],
    "30 ↑": [],
    "36 ↑": [],
    "48 ↑": [],
    "60 ↑": []
  };
  final Map<String, double> totalCubic = {
    "All": 0.0,
    "24 ↓": 0.0,
    "24 ↑": 0.0,
    "30 ↑": 0.0,
    "36 ↑": 0.0,
    "48 ↑": 0.0,
    "60 ↑": 0.0
  };
  int selectIndex = 0;

  void _dataAddBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddData(
          onDataAdded: (String data) {
            List<String> temp = data.split("-");
            int tmpRound = int.parse(temp[1]);
            String categoryKey = _getCategoryKey(tmpRound);
            double tempvalue = CubicCalulate.cubicCal(data);
            setState(() {
              categorizedData["All"]!.add(data);
              categorizedData[categoryKey]!.add(data);
              totalCubic["All"] = totalCubic["All"]! + tempvalue;
              totalCubic[categoryKey] = totalCubic[categoryKey]! + tempvalue;
            });
          },
          initialData: categorizedData["All"]!,
        );
      },
    );
  }

  String _getCategoryKey(int round) {
    if (round < 24) {
      return "24 ↓";
    } else if (round >= 24 && round < 30) {
      return "24 ↑";
    } else if (round >= 30 && round < 36) {
      return "30 ↑";
    } else if (round >= 36 && round < 48) {
      return "36 ↑";
    } else if (round >= 48 && round < 60) {
      return "48 ↑";
    } else if (round >= 60 && round < 72) {
      return "60 ↑";
    } else {
      return "";
    }
  }

  void _chooseRound(int index) {
    setState(() {
      selectIndex = index;
    });
  }

  void _details(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Details(
          lengthAndRound: categorizedData[category[selectIndex]]![index],
        );
      },
    );
  }

  Widget _datalList() {
    List<String> displayList = [];
    switch (selectIndex) {
      case 0:
        displayList = categorizedData["All"]!;
        break;
      case 1:
        displayList = categorizedData["24 ↓"]!;
        break;
      case 2:
        displayList = categorizedData["24 ↑"]!;
        break;
      case 3:
        displayList = categorizedData["30 ↑"]!;
        break;
      case 4:
        displayList = categorizedData["36 ↑"]!;
        break;
      case 5:
        displayList = categorizedData["48 ↑"]!;
        break;
      case 6:
        displayList = categorizedData["60 ↑"]!;
      default:
        break;
    }
    return ListView.builder(
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 219, 219, 219),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("${index + 1}"),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${displayList[index]} = ${CubicCalulate.cubicCal(displayList[index])}",
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _details(context, index);
                      },
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubic Calculator"),
        backgroundColor: Colors.cyan[100],
        actions: [
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () {
                _dataAddBottomsheet(context);
              },
              icon: const Icon(Icons.add),
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 179, 236, 243),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              category[index],
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              totalCubic[category[index]]!.toStringAsFixed(1),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            color: Colors.cyan[100],
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: index == selectIndex
                            ? Colors.amber[200]
                            : Colors.amber[50],
                      ),
                      child: IconButton(
                        onPressed: () {
                          _chooseRound(index);
                        },
                        icon: Text(
                          category[index],
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 650,
                child: _datalList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
