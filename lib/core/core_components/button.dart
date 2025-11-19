import 'package:doctor_program/core/const/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Button extends StatelessWidget {
  final String text;
 final void Function() ontap;
  final TextDirection? textDirection;
  const Button({
    super.key,
    required this.text,
    required this.ontap,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child:
      Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(5.vmin),
        ),
        child: InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.vmin),
              border: Border.all(
                color: ConstColors.darkBlue,
              ),
              color: ConstColors.darkBlue,
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                textDirection: textDirection,
              ),
            ),
            width: 45.vmin,
            height: 15.vmin,
          ),
        ),
      ),
    );
  }
}
