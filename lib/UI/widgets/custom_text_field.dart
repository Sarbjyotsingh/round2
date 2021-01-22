import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:round2/UI/widgets/always_disabled_focus_node.dart';

class CustomTextField extends StatelessWidget {
  final VoidCallback onTap;
  final String hintText;
  final bool isDisabledFocusNode;
  final TextEditingController textEditingController;
  final Function validator;
  CustomTextField({
    this.onTap,
    @required this.hintText,
    this.isDisabledFocusNode = false,
    @required this.textEditingController,
    @required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 10, color: Colors.black),
        errorStyle: TextStyle(fontSize: 8)
      ),
      focusNode: isDisabledFocusNode ? AlwaysDisabledFocusNode() : FocusNode(),
    );
  }
}
