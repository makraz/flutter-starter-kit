import 'package:flutter/material.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton({
    super.key,
    this.leftIcon,
    this.rightIcon,
    super.margin,
    super.onPressed,
    super.buttonStyle,
    super.alignment,
    super.isDisabled,
    super.height,
    super.width,
    required super.text,
    this.textHorizontalPadding = const EdgeInsets.symmetric(horizontal: 16.0),
  });

  final Widget? leftIcon;
  final Widget? rightIcon;
  final EdgeInsets textHorizontalPadding;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget(context),
          )
        : buildElevatedButtonWidget(context);
  }

  Widget buildElevatedButtonWidget(BuildContext context) {
    final theme = Theme.of(context); 

    return SizedBox(
      height: height ?? 48,
      width: width ?? double.maxFinite,
      child: ElevatedButton(
        style: buttonStyle ??
            ElevatedButton.styleFrom(
              backgroundColor: (isDisabled ?? false)
                  ? theme.colorScheme.onSurface.withOpacity(0.12)
                  : theme.colorScheme.primary,
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              elevation: 2,
            ),
        onPressed: (isDisabled ?? false) ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leftIcon != null) leftIcon!,
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Padding(
                  padding: textHorizontalPadding,
                  child: Text(
                    text,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: (isDisabled ?? false)
                          ? theme.colorScheme.onSurface.withOpacity(0.38)
                          : theme.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
            ),
            if (rightIcon != null) rightIcon!,
          ],
        ),
      ),
    );
  }
}
