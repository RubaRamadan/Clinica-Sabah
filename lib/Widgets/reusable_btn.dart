import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ReusableButton extends StatefulWidget {
  const ReusableButton(
      {super.key,
      required this.btnText,
      required this.onTapFunction,
      required this.width,
      required this.height,
      this.radius = 0,
      this.isWhiteBg = false});
  final String btnText;
  final Function onTapFunction;
  final double width;
  final double height;
  final double radius;
  final bool isWhiteBg;

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  bool isLongPressed = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTapFunction();
      },
      onLongPress: () {
        setState(() {
          isLongPressed = true;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color:
              widget.isWhiteBg && !isLongPressed ? Colors.white : kBasicColor,
          borderRadius: BorderRadius.circular(widget.radius),
        ),
        child: Center(
          child: Text(
            widget.btnText.toUpperCase(),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: widget.isWhiteBg && !isLongPressed
                    ? kBasicColor
                    : Colors.white),
          ),
        ),
      ),
    );
  }
}

class ReUsableTextButton extends StatelessWidget {
  const ReUsableTextButton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.isGrey,
      required this.isUnderLined});
  final String text;
  final Function onPress;
  final bool isGrey;
  final bool isUnderLined;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: 15,
            decoration:
                isUnderLined ? TextDecoration.underline : TextDecoration.none,
            fontWeight: FontWeight.bold,
            color: isGrey ? Colors.grey : kBasicColor),
      ),
    );
  }
}
