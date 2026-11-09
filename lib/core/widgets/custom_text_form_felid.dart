import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextFormFelid extends StatefulWidget {
  final String hintText;
  final bool isPassword; 
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const CustomTextFormFelid({super.key, required this.hintText, this.isPassword = false, this.validator, this.controller});

  @override
  State<CustomTextFormFelid> createState() => _CustomTextFormFelidState();
}

class _CustomTextFormFelidState extends State<CustomTextFormFelid> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      textDirection: TextDirection.rtl,
      obscureText: widget.isPassword && isObsecure,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintStyle: AppTextStyle.hintTextStyle,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.borderColor,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.borderColor,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColor.mainColor,
          )
        ),
        suffixIcon: widget.isPassword? InkWell(
          onTap: () {
            setState(() {
              isObsecure =! isObsecure;
            });
          },
          child: const Icon(Icons.visibility)
        ): null,
      ),
      cursorColor: AppColor.mainColor,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}