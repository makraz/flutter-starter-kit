import 'dart:ui';

import 'package:flutter/material.dart';

class Button extends AbstractButton {
  Button({
    super.key,
    required super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus = false,
    super.clipBehavior = Clip.none,
    super.buttonType,
    Widget? icon,
    Widget? label,
    super.iconAlignment,
  }) : super(
          autofocus: autofocus ?? false,
          child: _ButtonWithIconChild(
            icon: icon,
            label: label,
            buttonStyle: style,
            iconAlignment: iconAlignment,
          ),
        );
}

abstract class AbstractButton extends ButtonStyleButton {
  const AbstractButton({
    super.key,
    super.onPressed,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    this.buttonType = ButtonType.text,
    Widget? icon,
    IconAlignment iconAlignment = IconAlignment.start,
    required super.child,
  });

  final ButtonType buttonType;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final BorderSide? side = switch (buttonType) {
      ButtonType.outlined => BorderSide(color: colorScheme.onSurface.withValues(alpha: 0.12)),
      ButtonType.text || ButtonType.elevated || ButtonType.filled => null,
    };
    final double elevation = switch (buttonType) {
      ButtonType.text || ButtonType.outlined => 0,
      ButtonType.elevated => 2,
      ButtonType.filled => 1,
    };
    final Color disabledBackgroundColor = switch (buttonType) {
      ButtonType.text || ButtonType.outlined => Colors.transparent,
      ButtonType.elevated => colorScheme.onSurface.withValues(alpha: 0.12),
      ButtonType.filled => colorScheme.onSurface.withValues(alpha: 0.12),
    };
    final Color backgroundColor = switch (buttonType) {
      ButtonType.text || ButtonType.outlined => Colors.transparent,
      ButtonType.elevated => colorScheme.onPrimary,
      ButtonType.filled => colorScheme.onPrimary,
    };

    return styleForm(
      backgroundColor: backgroundColor,
      foregroundColor: colorScheme.primary,
      disabledBackgroundColor: disabledBackgroundColor,
      disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
      shadowColor: theme.shadowColor,
      elevation: elevation,
      textStyle: theme.textTheme.labelLarge,
      padding: _scaledPadding(context),
      minimumSize: const Size(64, 36),
      maximumSize: Size.infinite,
      side: side,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      enabledMouseCursor: SystemMouseCursors.click,
      disabledMouseCursor: SystemMouseCursors.basic,
      visualDensity: theme.visualDensity,
      tapTargetSize: theme.materialTapTargetSize,
      animationDuration: kThemeChangeDuration,
      enableFeedback: true,
      alignment: Alignment.center,
      splashFactory: InkRipple.splashFactory,
    );
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return ElevatedButtonTheme.of(context).style;
  }

  static ButtonStyle styleForm({
    Color? foregroundColor,
    Color? backgroundColor,
    Color? disabledForegroundColor,
    Color? disabledBackgroundColor,
    Color? shadowColor,
    Color? surfaceTintColor,
    Color? iconColor,
    double? iconSize,
    Color? disabledIconColor,
    Color? overlayColor,
    double? elevation,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
    MouseCursor? enabledMouseCursor,
    MouseCursor? disabledMouseCursor,
    VisualDensity? visualDensity,
    MaterialTapTargetSize? tapTargetSize,
    Duration? animationDuration,
    bool? enableFeedback,
    AlignmentGeometry? alignment,
    InteractiveInkFeatureFactory? splashFactory,
    ButtonLayerBuilder? backgroundBuilder,
    ButtonLayerBuilder? foregroundBuilder,
  }) {
    final WidgetStateProperty<Color?>? backgroundColorProp =
        ButtonStyleButton.defaultColor(backgroundColor, disabledBackgroundColor);
    final WidgetStateProperty<Color?>? overlayColorProp = switch ((foregroundColor, overlayColor)) {
      (_, null) => null,
      (_, Color(a: 0.0)) => WidgetStatePropertyAll<Color?>(overlayColor),
      (_, final Color color) || (final Color color, _) => WidgetStateProperty<Color?>.fromMap(
          <WidgetState, Color?>{
            WidgetState.pressed: color.withValues(alpha: 0.1),
            WidgetState.hovered: color.withValues(alpha: 0.08),
            WidgetState.focused: color.withValues(alpha: 0.1),
          },
        ),
    };

    WidgetStateProperty<double>? elevationValue;
    if (elevation != null) {
      elevationValue = WidgetStateProperty<double>.fromMap(
        <WidgetStatesConstraint, double>{
          WidgetState.disabled: 0,
          WidgetState.pressed: elevation + 6,
          WidgetState.hovered: elevation + 2,
          WidgetState.focused: elevation + 2,
          WidgetState.any: elevation,
        },
      );
    }

    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      foregroundColor: ButtonStyleButton.defaultColor(foregroundColor, disabledForegroundColor),
      backgroundColor: backgroundColorProp,
      overlayColor: overlayColorProp,
      shadowColor: ButtonStyleButton.allOrNull<Color>(shadowColor),
      surfaceTintColor: ButtonStyleButton.allOrNull<Color>(surfaceTintColor),
      iconColor: ButtonStyleButton.defaultColor(iconColor, disabledIconColor),
      iconSize: ButtonStyleButton.allOrNull<double>(iconSize),
      elevation: elevationValue,
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(maximumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
      mouseCursor: WidgetStateProperty<MouseCursor?>.fromMap(
        <WidgetStatesConstraint, MouseCursor?>{
          WidgetState.disabled: disabledMouseCursor,
          WidgetState.any: enabledMouseCursor,
        },
      ),
      visualDensity: visualDensity,
      tapTargetSize: tapTargetSize,
      animationDuration: animationDuration,
      enableFeedback: enableFeedback,
      alignment: alignment,
      splashFactory: splashFactory,
      backgroundBuilder: backgroundBuilder,
      foregroundBuilder: foregroundBuilder,
    );
  }

  EdgeInsetsGeometry _scaledPadding(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double padding1x = theme.useMaterial3 ? 24.0 : 16.0;
    final double defaultFontSize = theme.textTheme.labelLarge?.fontSize ?? 14.0;
    final double effectiveTextScale = MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0;

    return ButtonStyleButton.scaledPadding(
      EdgeInsets.symmetric(horizontal: padding1x),
      EdgeInsets.symmetric(horizontal: padding1x / 2),
      EdgeInsets.symmetric(horizontal: padding1x / 2 / 2),
      effectiveTextScale,
    );
  }
}

class _ButtonWithIconChild extends StatelessWidget {
  const _ButtonWithIconChild({
    this.label,
    this.icon,
    required this.buttonStyle,
    required this.iconAlignment,
  });

  final Widget? label;
  final Widget? icon;
  final ButtonStyle? buttonStyle;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final double defaultFontSize = buttonStyle?.textStyle?.resolve(const <WidgetState>{})?.fontSize ?? 14.0;
    final double scale = clampDouble(MediaQuery.textScalerOf(context).scale(defaultFontSize) / 14.0, 1.0, 2.0) - 1.0;
    final double gap = lerpDouble(8, 4, scale)!;
    return label != null && icon == null
        ? label!
        : (label != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: iconAlignment == IconAlignment.start
                    ? <Widget>[icon!, SizedBox(width: gap), Flexible(child: label!)]
                    : <Widget>[Flexible(child: label!), SizedBox(width: gap), icon!],
              )
            : icon!);
  }
}

enum ButtonType {
  text,
  outlined,
  elevated,
  filled,
}
