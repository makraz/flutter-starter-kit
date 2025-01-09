import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldType = TextFieldType.outlined,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines = 1,
    this.style,
    this.inputDecoration,
    this.errorText,
    this.helperText,
    this.counterText,
    this.enabled = true,
    this.readOnly = false,
    this.focusNode,
    this.borderColor = Colors.black, 
    this.focusedBorderColor,
    this.backgroundColor =   Colors.grey,
    this.inputFormatters,

  });

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextFieldType textFieldType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType keyboardType;
  final bool obscureText;
  final int maxLines;
  final TextStyle? style;
  final InputDecoration? inputDecoration;
  final String? errorText;
  final String? helperText;
  final String? counterText;
  final bool enabled;
  final bool readOnly;
  final FocusNode? focusNode;
  final Color borderColor;
  final Color? focusedBorderColor;
  final Color? backgroundColor;
  final List<TextInputFormatter>? inputFormatters;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly,
      inputFormatters: inputFormatters,
      decoration: inputDecoration ??
          _buildInputDecoration(
            context,
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorText: errorText,
            helperText: helperText,
            counterText: counterText,
          ),
    );
  }

  InputDecoration _buildInputDecoration(
    BuildContext context, {
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    String? helperText,
    String? counterText,
  }) {
    final Color effectiveFocusedBorderColor =
        focusedBorderColor ?? Theme.of(context).colorScheme.primary;

    final OutlineInputBorder outlinedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );

    final OutlineInputBorder focusedOutlinedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: effectiveFocusedBorderColor,
        width: 2.0,
      ),
    );

    final UnderlineInputBorder underlinedBorderStyle = UnderlineInputBorder(
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );

    final UnderlineInputBorder focusedUnderlinedBorderStyle =
        UnderlineInputBorder(
      borderSide: BorderSide(
        color: effectiveFocusedBorderColor,
        width: 2.0,
      ),
    );

    switch (textFieldType) {
      case TextFieldType.outlined:
        return InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          helperText: helperText,
          counterText: counterText,
          filled: true,
          fillColor: backgroundColor,
          border: outlinedBorderStyle,
          focusedBorder: focusedOutlinedBorderStyle,
          enabledBorder: outlinedBorderStyle,
          disabledBorder: outlinedBorderStyle,
        );
      case TextFieldType.filled:
        return InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          helperText: helperText,
          counterText: counterText,
          filled: true,
          fillColor: backgroundColor,
          border: InputBorder.none,
        );
      case TextFieldType.underlined:
        return InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          errorText: errorText,
          helperText: helperText,
          counterText: counterText,
          filled: true,
          fillColor: backgroundColor,
          border: underlinedBorderStyle,
          focusedBorder: focusedUnderlinedBorderStyle,
          enabledBorder: underlinedBorderStyle,
          disabledBorder: underlinedBorderStyle,
        );
    }
  }
}

enum TextFieldType {
  outlined,
  filled,
  underlined,
}
