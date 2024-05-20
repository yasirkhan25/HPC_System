import 'package:flutter/material.dart';
import 'package:hangu_pesco_complaints_system/core/color/color.dart';

class CustomTextField extends StatelessWidget {
  final onChanged;
  final validator;
  final hintText;
  final controller;
  final preFixIcon;
  final maxLine;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool readOnly;
  final textInputAction;
  final keyBoardType;
  final IconButton? suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final bool isMultiline;
  final TextAlign textAlign;

  CustomTextField({
    this.isMultiline = false,
    this.preFixIcon,
    this.maxLine = 1,
    this.readOnly = false,
    this.autofillHints,
    this.onChanged,
    this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.textInputAction,
    this.keyBoardType,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    EdgeInsets? contentPadding,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      keyboardType: keyBoardType,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      maxLines: maxLine,
      obscureText: obscureText,
      autofillHints: autofillHints,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400
      ),
      onFieldSubmitted: onFieldSubmitted,
      textAlign: textAlign,
      decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: borderColor, width: 1),
          borderSide: BorderSide(color: Color(0xffD4D9E4), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColor, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7658B), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffF7658B), width: 1),
          borderRadius: BorderRadius.circular(7),
        ),

        errorStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffF7658B),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: preFixIcon
      ),

    );
  }
}
