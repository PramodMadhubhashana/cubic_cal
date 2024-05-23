import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  final String lengthAndRound;
  const Details({super.key, required this.lengthAndRound});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int length = 0;
  int round = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<String> temp = widget.lengthAndRound.split("-");
    length = int.parse(temp[0]);
    round = int.parse(temp[1]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Length : $length" " ft",
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(
                  "Round : $round" " inch",
                  style: const TextStyle(fontSize: 22),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "category : ${round < 24 ? "24 ↓" : round >= 24 && round < 30 ? "24 ↑" : round >= 30 && round < 36 ? "30 ↑" : round >= 36 && round < 48 ? "36 ↑" : round >= 48 && round < 60 ? "48 ↑" : round >= 60 && round < 72 ? "60 ↑" : "72 ↑"}",
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Cubic Value : ",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
