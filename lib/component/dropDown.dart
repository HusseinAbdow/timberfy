import 'package:flutter/material.dart';

class dropDown extends StatefulWidget {
  final void Function(String?)? onChanged;
  final String value;
  const dropDown({super.key, required this.onChanged, required this.value});

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,

      items: [
        DropdownMenuItem<String>(child: Text("Men"), value: "men"),
        DropdownMenuItem<String>(child: Text("Women"), value: "women"),
      ],
      onChanged: widget.onChanged,

      //style
      style: TextStyle(color: Colors.black),
      elevation: 8,
      underline: Container(color: Colors.black, height: 2),

      //picking icon accoring to gender
      icon: Icon(
        widget.value == "men" ? Icons.male : Icons.female,
        color: Colors.black, // White icon color
      ),
    );
  }
}
