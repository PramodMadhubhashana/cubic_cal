import 'package:cubic_cal/widget/add.dart';
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

  List<String> lengthAndRound = [];

  void _dataAddBottomsheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AddData(
          onDataAdded: (String data) {
            setState(() {
              lengthAndRound.add(data);
            });
          },
          initialData: lengthAndRound,
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return (Column(
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
                                  "552",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
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
                    return (Row(
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
                              color: Color.fromARGB(255, 255, 255, 255)),
                          child: IconButton(
                            onPressed: () {},
                            icon: Text(category[index]),
                          ),
                        )
                      ],
                    ));
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(right: 40),
                height: 500,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: lengthAndRound.length,
                  itemBuilder: (context, index) {
                    return (Container(
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
                                  lengthAndRound[index],
                                  style: const TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
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
                    ));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
