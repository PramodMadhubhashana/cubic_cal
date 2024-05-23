import 'package:cubic_cal/widget/cuNoKeyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddData extends StatefulWidget {
  final Function(String data) onDataAdded;
  final List<String> initialData;
  const AddData(
      {super.key, required this.onDataAdded, required this.initialData});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String text = '';
  List<String> lengthAndRound = [];
  final ScrollController _scrollController = ScrollController();

  void _onKeyboardTap(String value) {
    setState(() {
      if (text.contains('-') && value == '-' || text == '' && value == '-') {
        return;
      } else {
        text = text + value;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (text.isNotEmpty) {
        text = text.substring(0, text.length - 1);
      }
    });
  }

  void _onClear() {
    setState(() {
      text = '';
    });
  }

  void _addData() {
    setState(() {
      if (text == '0' || text == '-') {
        text = '';
        return;
      } else {
        final regExp = RegExp(r'^[1-9]\d*\s*-\s*[1-9]\d*$');
        if (!regExp.hasMatch(text)) {
          text = '';
          return;
        } else {
          lengthAndRound.add(text);
          widget.onDataAdded(text);
          _scrollToBottom();
        }
      }
      text = '';
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lengthAndRound = List.from(widget.initialData);
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      padding: const EdgeInsets.all(20),
      height: 510,
      child: Column(
        children: [
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: lengthAndRound.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return (Text(
                  "${lengthAndRound[index]}" ",",
                  style: const TextStyle(fontSize: 30),
                ));
              },
            ),
          ),
          TextField(
            keyboardType: TextInputType.none,
            controller: TextEditingController(text: text),
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: CustomNumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            onBackspace: _onBackspace,
            onClear: _onClear,
            addData: _addData,
          ))
        ],
      ),
    ));
  }
}
