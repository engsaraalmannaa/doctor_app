import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/const_colors.dart';

class AppTextFormField extends StatefulWidget {
  final TextInputType? keyboardType;
  final dynamic hint;
  final dynamic icon;
  final TextEditingController? controller;
  final dynamic isPass;
  final FormFieldValidator<String>? validator;
  final TextDirection? textDirection;
  final dynamic color;
  final bool enabled;
  final int minlines;
  final Color? fillColor;
  final bool readOnly;


  const AppTextFormField({
    super.key,
    this.hint,
    this.icon,
    this.keyboardType,
    this.controller,
    this.isPass = false,
    this.validator,
    this.textDirection,
    required this.color,
    this.enabled = true,
    this.readOnly = false,
    required this.minlines, this.fillColor

  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final FocusNode _focusNode = FocusNode();
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.2.vmin),
      child: Padding(
        padding: EdgeInsets.only(left: 5.vmin, right: 5.vmin),
        child: TextFormField(
           readOnly: widget.readOnly,
          maxLines: null,
          minLines: widget.minlines,
          enabled: widget.enabled,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPass && _hidden,
          controller: widget.controller,
          validator: widget.validator,
          textDirection: widget.textDirection,
          cursorColor: ConstColors.darkBlue,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: widget.color,
            ),
            hintTextDirection: widget.textDirection,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: ConstColors.darkBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: ConstColors.darkBlue),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.vmin)),
            fillColor: widget.fillColor ?? Colors.white54,
            filled: true,
            prefixIcon: widget.icon,
            suffixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      _hidden = !_hidden;
                      setState(() {});
                    },
                    icon: Visibility(
                      visible: _hidden,
                      replacement: const Icon(Icons.visibility),
                      child: const Icon(Icons.visibility_off),
                    ))
                : null,
          ),
        ),
      ),
    );
  }
}
class AppTextFormField1 extends StatefulWidget {
  final TextInputType? keyboardType;
  final dynamic hint;
  final dynamic icon;
  final TextEditingController? controller;
  final dynamic isPass;
  final FormFieldValidator<String>? validator;
  final TextDirection? textDirection;
  final dynamic color;
  final bool enabled;
  final Color? fillColor;
  final bool readOnly;


  const AppTextFormField1({
    super.key,
    this.hint,
    this.icon,
    this.keyboardType,
    this.controller,
    this.isPass = false,
    this.validator,
    this.textDirection,
    required this.color,
    this.enabled = true,
    this.readOnly = false,
    //required this.minlines,
     this.fillColor

  });

  @override
  State<AppTextFormField1> createState() => _AppTextFormField1State();
}

class _AppTextFormField1State extends State<AppTextFormField1> {
  final FocusNode _focusNode = FocusNode();
  bool _hidden = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.2.vmin),
      child: Padding(
        padding: EdgeInsets.only(left: 5.vmin, right: 5.vmin),
        child: TextFormField(
           readOnly: widget.readOnly,
          //maxLines: null,
          //minLines: widget.minlines,
          enabled: widget.enabled,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPass && _hidden,
          controller: widget.controller,
          validator: widget.validator,
          textDirection: widget.textDirection,
          cursorColor: ConstColors.darkBlue,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: widget.color,
            ),
            hintTextDirection: widget.textDirection,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: ConstColors.darkBlue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: ConstColors.darkBlue),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.vmin),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.vmin)),
            fillColor: widget.fillColor ?? Colors.white54,
            filled: true,
            suffixIcon: widget.icon,
            prefixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      _hidden = !_hidden;
                      setState(() {});
                    },
                    icon: Visibility(
                      visible: _hidden,
                      replacement: const Icon(Icons.visibility),
                      child: const Icon(Icons.visibility_off),
                    ))
                : null,
          ),
        ),
      ),
    );
  }
}
