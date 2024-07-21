import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class ReusableDropDownMenu extends StatefulWidget {
  const ReusableDropDownMenu(
      {super.key,
      required this.list,
      required this.text,
      required this.hint,
      required this.onSelected,
      this.controller,
      required this.validationFunc,
      this.radius = 0});
  final List<String> list;
  final String text;
  final String hint;
  final Function onSelected;
  final TextEditingController? controller;
  final Function validationFunc;
  final double radius;
  @override
  State<ReusableDropDownMenu> createState() => _ReusableDropDownMenuState();
}

class _ReusableDropDownMenuState extends State<ReusableDropDownMenu> {
  String? dropDownValue;
@override
  void initState() {
  // widget.controller!.text=widget.list[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        DropdownButtonFormField<String>(
          // autovalidateMode: AutovalidateMode.always,
          value: dropDownValue,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 25, 10),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kBasicColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            ),
            errorStyle: const TextStyle(
              fontSize: 10.0,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
          items: widget.list.map(
            (String label) {
              return DropdownMenuItem<String>(
                value: label,
                child: Text(
                  label,
                ),
              );
            },
          ).toList(),
          hint: Text(widget.hint),
          onChanged: (String? value) {
            setState(() {
              dropDownValue = value;
            });
            widget.onSelected(value);
          },
          validator: (value) {
            if (value==null) {
              return 'هذا الحقل مطلوب .';
            }
            return null;
          },
        ),
      ],
    );
  }
}
