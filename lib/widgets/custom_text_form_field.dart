import 'package:chalyaar/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.height,
    required this.text, this.suffixIcon,
  });

  final double height;
  final String text;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height*0.1,
      child: TextFormField(
        style:  AppStyle.txtMontserratRomanSemiBold11Black,
        decoration: InputDecoration(
          hintStyle: AppStyle.txtMontserratRomanSemiBold11Black54,
          hintText: text,
          isDense: true,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black54),
            gapPadding:0
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26)
          ),
          focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: Colors.black87)
          )
        ),
      ),
    );
  }
}