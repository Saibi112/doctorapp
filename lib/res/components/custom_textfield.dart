import 'package:doctor_app/consts/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textEditingController;
  final Color textColor;
  final Color borderColor;
  final Color inputColor;

  const CustomTextField({
    Key? key,
    required this.hint,
    this.textEditingController,
    this.textColor = Colors.black,
    this.borderColor = Colors.black, this.inputColor=Colors.black,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // :widget.textEditingController,
      style: TextStyle(color:widget.inputColor),
      cursorColor: AppColours.blueColor,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: widget.borderColor),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.textColor),
      ),
    );
  }
}
