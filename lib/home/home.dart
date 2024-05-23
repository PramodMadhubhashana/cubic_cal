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

  List<String> lengthAndRoundAll = [];
  List<String> twentyFourDown = [];
  List<String> twentyFourToThirty = [];
  List<String> thirtyToThirtySix = [];
  List<String> thirtySixToFourtyEight = [];
  List<String> fourtyEightToSixty = [];
  List<String> sixtyToSeventyTwo = [];
  int selectIndex = 0;
  double total = 0.0;
  double twentyFourD = 0.0;
  double twentyForThirty = 0.0;
  double thirtthirtySix = 0.0;
  double thirtySixfourtyEight = 0.0;
  double fourtyaEightsixty = 0.0;
  double sixtySeventyTwo = 0.0;

  void _dataAddBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddData(
          onDataAdded: (String data) {
            List<String> temp = data.split("-");
            int tmpRound = int.parse(temp[1]);
            setState(() {
              lengthAndRoundAll.add(data);
              if (tmpRound < 24) {
                twentyFourDown.add(data);
              } else if (tmpRound >= 24 && tmpRound < 30) {
                twentyFourToThirty.add(data);
              } else if (tmpRound >= 30 && tmpRound < 36) {
                thirtyToThirtySix.add(data);
              } else if (tmpRound >= 36 && tmpRound < 48) {
                thirtySixToFourtyEight.add(data);
              } else if (tmpRound >= 48 && tmpRound < 60) {
                fourtyEightToSixty.add(data);
              } else if (tmpRound >= 60 && tmpRound < 72) {
                sixtyToSeventyTwo.add(data);
              }
            });
          },
          initialData: lengthAndRoundAll,
        );
      },
    );
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
          lengthAndRound: lengthAndRoundAll[index],
        );
      },
    );
  }

  Widget _datalList() {
    List<String> displayList = [];
    switch (selectIndex) {
      case 0:
        displayList = lengthAndRoundAll;
        break;
      case 1:
        displayList = twentyFourDown;
        break;
      case 2:
        displayList = twentyFourToThirty;
        break;
      case 3:
        displayList = thirtyToThirtySix;
        break;
      case 4:
        displayList = thirtySixToFourtyEight;
        break;
      case 5:
        displayList = fourtyEightToSixty;
        break;
      case 6:
        displayList = sixtyToSeventyTwo;
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
                      displayList[index],
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
                            const Text(
                              "552", // Sample text
                              style: TextStyle(
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
