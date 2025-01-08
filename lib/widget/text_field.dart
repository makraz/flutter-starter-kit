import 'package:flutter/material.dart';

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
    final OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
        width: 1.0,
      ),
    );

    final OutlineInputBorder focusedBorderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: 2.0,
      ),
    );

    final InputDecoration baseDecoration = InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      helperText: helperText,
      counterText: counterText,
      border: borderStyle,
      focusedBorder: focusedBorderStyle,
      enabledBorder: borderStyle,
      disabledBorder: borderStyle,
      filled: textFieldType == TextFieldType.filled,
      fillColor: textFieldType == TextFieldType.filled
          ? Theme.of(context).colorScheme.surface.withOpacity(0.1)
          : null,
    );

    switch (textFieldType) {
      case TextFieldType.outlined:
        return baseDecoration;
      case TextFieldType.filled:
        return baseDecoration;
      case TextFieldType.underlined:
        return baseDecoration.copyWith(
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
              width: 1.0,
            ),
          ),
        );
    }
  }
}

enum TextFieldType {
  outlined,
  filled,
  underlined,
}
