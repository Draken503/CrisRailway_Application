import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String labelText;
  final Color borderColor;

  MyTextField({required this.labelText, required this.borderColor});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
              color: _isFocused ? widget.borderColor : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold
          ),
        ),

        Container(
          width: 250, // Set the desired width
          height: 30,
          child: TextField(
            focusNode: _focusNode,
            textAlignVertical: TextAlignVertical.center,
            cursorHeight: 16,
            cursorColor: Colors.indigo,
            style: TextStyle(color: Colors.indigo),
            decoration: InputDecoration(
              // labelStyle: TextStyle(color: Colors.red),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: widget.borderColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(color: widget.borderColor, width: 2),
              ),
            ),
          ),
        )
      ],
    ),
    );
  }
}
