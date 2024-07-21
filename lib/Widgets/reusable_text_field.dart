
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Constants/colors.dart';
import '../Constants/const_lists.dart';
import 'reusable_drop_down_menu.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField({
    super.key,
    required this.onChangedFunc,
    required this.validationFunc,
    required this.hint,
    this.isEnable = true,
    required this.textEditingController,
    this.radius=0,
    required this.text,
    this.maxLines=1,
  });
  final Function onChangedFunc;
  final Function validationFunc;
  final String hint;
  final String text;
  final bool isEnable;
  final TextEditingController textEditingController;
  final double radius;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          ),
        ),
        TextFormField(
          autocorrect: false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: textEditingController,
          enabled: isEnable,
          maxLines: maxLines,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hint,
            // labelStyle: TextStyle(
            //   color: kBasicColor
            // ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
            enabledBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              const BorderSide(color: kBasicColor, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
            errorStyle: const TextStyle(
              fontSize: 10.0,
            ),
            focusedErrorBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
          ),
          validator: (value) {
            return validationFunc(value);
          },
          onChanged: (value) => onChangedFunc(value),
        ),
      ],
    );
  }
}



class ReusableInputNumberField extends StatefulWidget {
  const ReusableInputNumberField(
      {super.key,
        required this.onChangedFunc,
        required this.validationFunc,
        required this.text,
        // required this.textFieldWidth,
        // required this.rowWidth,
        required this.controller,
        this.radius=0});
  final Function onChangedFunc;
  final Function validationFunc;
  final String text;
  // final double textFieldWidth;
  // final double rowWidth;
  final TextEditingController controller;
  final double radius;
  @override
  State<ReusableInputNumberField> createState() =>
      _ReusableInputNumberFieldState();
}

class _ReusableInputNumberFieldState extends State<ReusableInputNumberField> {
  @override
  void initState() {
    // widget.controller.text == '';
    // ? widget.controller.text = "0"
    // : widget.controller.text = widget.controller.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            widget.text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            TextFormField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(20, 0, 25, 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.1), width: 1),
                  borderRadius:
                    BorderRadius.all(Radius.circular(widget.radius)),
                ),
                focusedBorder:   OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: kBasicColor, width: 2),
                  borderRadius:
                  BorderRadius.all(Radius.circular(widget.radius)),
                ),
                errorStyle: const TextStyle(
                  fontSize: 10.0,
                ),
                focusedErrorBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                  borderSide: const BorderSide(width: 1, color: Colors.red),
                ),
              ),
              controller: widget.controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                // WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            SizedBox(
              height: 38.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    child: const Icon(
                      Icons.arrow_drop_up,
                      size: 18.0,
                    ),
                    onTap: () {
                      if (widget.controller.text != '') {
                        double currentValue =
                        double.parse(widget.controller.text);
                        setState(() {
                          currentValue = currentValue + double.parse('1');
                          widget.controller.text = (currentValue)
                              .toString(); // incrementing value
                        });
                      }
                    },
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.arrow_drop_down,
                      size: 18.0,
                    ),
                    onTap: () {
                      if (widget.controller.text != '') {
                        double currentValue =
                        double.parse(widget.controller.text);
                        setState(() {
                          currentValue = currentValue - double.parse('1');
                          widget.controller.text =
                              (currentValue > double.parse('0')
                                  ? currentValue
                                  : 0)
                                  .toString(); // decrementing value
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class ReusableVerificationTextField extends StatelessWidget {
  const ReusableVerificationTextField({
    super.key,
    required this.onChangedFunc,
    required this.validationFunc,
    required this.hint,
    this.isEnable = true,
    required this.textEditingController,
    this.radius=12,
    this.maxLines=1,
  });
  final Function onChangedFunc;
  final Function validationFunc;
  final String hint;
  final bool isEnable;
  final TextEditingController textEditingController;
  final double radius;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 68,
      child: TextFormField(
        controller: textEditingController,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        enabled: isEnable,
        maxLines: maxLines,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hint,
          // labelStyle: TextStyle(
          //   color: kBasicColor
          // ),
          filled: true,
          fillColor: Colors.white,
          // contentPadding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            const BorderSide(color: kBasicColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          errorStyle: const TextStyle(
            fontSize: 10.0,
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            borderSide: const BorderSide(width: 1, color: Colors.red),
          ),
        ),
        validator: (value) {
          return validationFunc(value);
        },
        onChanged: (value) => onChangedFunc(value),
      ),
    );
  }
}




class ReusablePhoneTextField extends StatefulWidget {
  const ReusablePhoneTextField({
    super.key,
    required this.onChangedFunc,
    required this.validationFunc,
    required this.hint,
    this.isEnable = true,
    required this.textEditingController,
    this.radius=0,
    required this.text,
    this.maxLines=1, required this.suffixController,
  });
  final Function onChangedFunc;
  final Function validationFunc;
  final String hint;
  final String text;
  final bool isEnable;
  final TextEditingController textEditingController;
  final TextEditingController suffixController;
  final double radius;
  final int maxLines;

  @override
  State<ReusablePhoneTextField> createState() => _ReusablePhoneTextFieldState();
}

class _ReusablePhoneTextFieldState extends State<ReusablePhoneTextField> {
  String? dropDownValue;
  @override
  void initState() {
    setState(() {
      dropDownValue=phoneSuffixes[0];
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(widget.text,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: SizedBox(
                width:MediaQuery.of(context).size.width - 185,
                child: TextFormField(
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: widget.textEditingController,
                  enabled: widget.isEnable,
                  maxLines: widget.maxLines,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    // labelStyle: TextStyle(
                    //   color: kBasicColor
                    // ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: kBasicColor, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                    ),
                    errorStyle: const TextStyle(
                      fontSize: 10.0,
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                    ),
                  ),
                  validator: (value) {
                    return widget.validationFunc(value);
                  },
                  onChanged: (value) => widget.onChangedFunc(value),
                ),
              ),
            ),
            SizedBox(
              width:  110,
              child: DropdownButtonFormField<String>(
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
                ),
                items: phoneSuffixes.map(
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
                  widget.suffixController.text=value!;
                },
              ),
            ),
            // DropdownMenu<String>(
            //   width:  110,
            //   // enableSearch: true,
            //   controller: widget.suffixController,
            //   inputDecorationTheme: InputDecorationTheme(
            //     filled: true,
            //     fillColor: Colors.white,
            //     // contentPadding: const EdgeInsets.fromLTRB(10, 0, 25, 5),
            //     // outlineBorder: BorderSide(color: Colors.black,),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide:
            //       BorderSide(color: Colors.black.withOpacity(0.1), width: 1),
            //       borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide:
            //       const BorderSide(color: kBasicColor, width: 1),
            //       borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            //     ),
            //   ),
            //   // menuStyle: ,
            //   menuHeight: 250,
            //   dropdownMenuEntries: phoneSuffixes
            //       .map<DropdownMenuEntry<String>>((String option) {
            //     return DropdownMenuEntry<String>(
            //       value: option,
            //       label: option,
            //     );
            //   }).toList(),
            //   enableFilter: true,
            //   onSelected: (String? val) {
            //     // setState(() {
            //     //   selectedItem = val!;
            //     //   var index = currenciesNamesList.indexOf(val);
            //     //   selectedCurrencyId = currenciesIdsList[index];
            //     // });
            //   },
            // ),
          ],
        ),
      ],
    );
  }
}