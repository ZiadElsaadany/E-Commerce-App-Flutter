import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      this.labelText,
      this.hintText,
      this.suffixIcon = false,
      required this.errorText,
      required this.onChanged})
      : super(key: key);
  final String? labelText;
  final String? hintText;
  final bool suffixIcon;
  bool check = false;
  final String errorText;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        } else {
          return null;
        }
      },
      obscureText:  widget.suffixIcon? !widget.check: widget.check,
      decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon
              ? InkWell(
                  onTap: () {
                    widget.check = !widget.check;
                    setState(() {});
                  },
                  child: Icon(widget.check
                      ? Icons.visibility
                      : Icons.visibility_off_outlined),
                )
              : null),
    );
  }
}
