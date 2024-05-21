import 'package:cubic_cal/widget/add.dart';
import 'package:cubic_cal/widget/details.dart';
import 'package:cubic_cal/widget/totalcubic.dart';
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
      switch (index) {
        case 0:
          // Display all
          break;
        case 1:
          // Display items in twentyFourDown
          break;
        case 2:
          // Display items in twentyFourToThirty
          break;
        case 3:
          // Display items in thirtyToThirtySix
          break;
        case 4:
          // Display items in thirtySixToFourtyEight
          break;
        case 5:
          // Display items in fourtyEightToSixty
          break;
        default:
          break;
      }
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

  Widget _datalist() {
    return ListView.builder(
      itemCount: lengthAndRoundAll.length,
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
                      lengthAndRoundAll[index],
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
      body: Column(
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
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
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
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: IconButton(
                        onPressed: () {
                          _chooseRound(index);
                        },
                        icon: Text(category[index]),
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
          Expanded(
            child: _datalist(),
          ),
        ],
      ),
    );
  }
}
