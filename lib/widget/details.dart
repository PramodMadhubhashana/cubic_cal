import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  final String lengthAndRound;
  const Details({super.key, required this.lengthAndRound});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late String lengthAndRound;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthAndRound = widget.lengthAndRound;
  }

  void _calculateCubic() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: Column(
        children: [
          Text(lengthAndRound),
        ],
      ),
    );
  }
}
