import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final VoidCallback onTap;
  final minWidth;
  final buttonText;
  final Color color;
  CustomFlatButton({
    @required this.buttonText,
    @required this.onTap,
    this.minWidth,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      minWidth: minWidth ?? MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      color: color ?? Colors.grey.shade300,
      child: Text(buttonText),
    );
  }
}
