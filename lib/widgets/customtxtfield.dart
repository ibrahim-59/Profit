import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.type,
     required this.onap,
    this.hintText,
  });
  String? hintText;
  Function(dynamic) onap;
  TextInputType type;


  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.black
        ),
        enabledBorder:OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
          ),
        ),

      ),
      onChanged: onap,

    );
  }
}
