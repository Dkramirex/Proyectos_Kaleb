import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  const Textbox(this._controller, this._label);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
            filled: true,
            labelText: _label,
            suffix: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                _controller.clear();
              },
            )),
      ),
    );
  }
}
