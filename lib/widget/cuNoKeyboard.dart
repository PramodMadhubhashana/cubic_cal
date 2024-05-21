import 'package:flutter/material.dart';

class CustomNumericKeyboard extends StatelessWidget {
  final ValueSetter<String> onKeyboardTap;
  final VoidCallback onBackspace;
  final VoidCallback onClear;
  final VoidCallback addData;

  CustomNumericKeyboard({
    required this.onKeyboardTap,
    required this.onBackspace,
    required this.onClear,
    required this.addData,
  });

  void _textInputHandler(String text) => onKeyboardTap.call(text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRow(['1', '2', '3']),
          _buildRow(['4', '5', '6']),
          _buildRow(['7', '8', '9']),
          _buildRow(['-', '0', '<']),
          _buildRow(['C', 'Add'])
        ],
      ),
    );
  }

  Expanded _buildRow(List<String> chars) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: chars.map((char) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ElevatedButton(
                onPressed: char == '<'
                    ? onBackspace
                    : char == 'C'
                        ? onClear
                        : char == 'Add'
                            ? addData
                            : () => _textInputHandler(char),
                child: Text(
                  char,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
