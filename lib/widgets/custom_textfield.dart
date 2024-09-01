import 'package:flutter/material.dart';
import 'package:portfolio/constants/colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({Key? key,  this.controller,  this.maxLine=1, this.hintText}) : super(key: key);

  final TextEditingController? controller;
  final int maxLine;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLine,
      style: TextStyle(
        color: CustomColor.scaffoldBg,
      ),
      decoration:InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: CustomColor.whitePrimary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: CustomColor.hintDark
          )
      ),
    );
  }
}
