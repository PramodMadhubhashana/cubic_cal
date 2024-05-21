import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
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
              itemCount: 100,
              itemBuilder: (context, index) {
                return (Text(
                  "$index",
                  style: TextStyle(fontSize: 30),
                ));
              },
            ),
          ),
          TextField(
            keyboardType: TextInputType.none,
            controller: TextEditingController(text: text),
            style: TextStyle(fontSize: 20),
            maxLength: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          NumericKeyboard(
            onKeyboardTap: _onKeyboardTap,
            textColor: Colors.black,
            rightButtonFn: () {},
            rightIcon: const Icon(
              Icons.backspace,
              color: Colors.black,
            ),
            leftIcon: Icon(Icons.check_circle),
            leftButtonFn: () {},
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ],
      ),
    ));
  }
}
