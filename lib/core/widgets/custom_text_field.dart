import 'package:flutter/material.dart';

import '../themes/app_text_styles.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.textEditingController,
    required this.hintText,
    this.labelText,
    this.prefix,
    required this.isObscure,
    this.onChange,
    this.validate,
    // this.hintTextStyle,
    // this.labelTextStyle,
    this.prefixText,
    this.autoFocus,
    this.suffixIcon,
    this.errorText,
    this.keyboardType,
    this.prefixIcon,
    this.initValue,
    this.onSuffixTap,
    this.readOnly,
    this.maxLength = 500,
    //this.borderColor,
    super.key,
  });

  final TextEditingController? textEditingController;
  final String hintText;
  final String? labelText;
  final String? prefixText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final bool isObscure;

  //final Color? fillColor;
  final bool? autoFocus;

  // final TextStyle? hintTextStyle;
  // final TextStyle? labelTextStyle;
  final ValueChanged<String>? onChange;
  final String? Function(String? val)? validate;
  final int maxLength;
  final String? initValue;
  final bool? readOnly;
  final TextInputType? keyboardType;
  final VoidCallback? onSuffixTap;

  //final OutlineInputBorder? borderColor;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  //bool isShow = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: widget.readOnly ?? false,
      initialValue: widget.textEditingController == null
          ? widget.initValue
          : null,
      validator: widget.validate,
      onChanged: widget.onChange,
      controller: widget.textEditingController,
      obscureText: widget.isObscure,
      textDirection: TextDirection.ltr,
      style: AppTextStyles.labelTextStyle,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: widget.prefixIcon,
        errorText: widget.errorText,
        //filled: true,
        prefixIconConstraints: const BoxConstraints(maxWidth: 40),
        suffixIcon: widget.suffixIcon == null
            ? null
            : GestureDetector(
                onTap: widget.onSuffixTap,
                child: widget.suffixIcon,
              ),
      ),
    );
  }
}
