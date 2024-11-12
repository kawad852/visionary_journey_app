import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

class BaseEditor extends StatelessWidget {
  final String? initialValue;
  final String? suffixText;
  final String? hintText;
  final Function(String)? onChanged;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? suffixIconConstraints;
  final AutovalidateMode? autoValidateMode;
  final bool autofocus;
  final EdgeInsetsGeometry? padding;
  final String? title;
  final String? helperText;
  final bool required;
  final bool obscureText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final int? maxLines;
  final TextDirection? textDirection;
  final bool withIndicator;
  final Function()? onTapOutside;
  final bool? filled;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final String? obscuringCharacter;
  final InputBorder? enabledBorder;

  const BaseEditor({
    super.key,
    this.initialValue,
    this.onChanged,
    this.readOnly = false,
    this.controller,
    this.validator,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
    this.suffixText,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.hintText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.autofocus = false,
    this.padding,
    this.title,
    this.required = false,
    this.floatingLabelBehavior,
    this.obscureText = false,
    this.helperText,
    this.prefixIcon,
    this.maxLines = 1,
    this.textDirection,
    this.withIndicator = true,
    this.onTapOutside,
    this.filled,
    this.fillColor,
    this.hintStyle,
    this.style,
    this.obscuringCharacter,
    this.enabledBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: style,
        obscuringCharacter: obscuringCharacter ?? '•',
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        readOnly: readOnly,
        initialValue: initialValue,
        autovalidateMode: autoValidateMode,
        autofocus: autofocus,
        obscureText: obscureText,
        maxLines: maxLines,
        textDirection: textDirection,
        decoration: InputDecoration(
          filled: filled,
          fillColor: fillColor,
          suffixText: suffixText,
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          suffixIconConstraints: suffixIconConstraints,
          prefixIconConstraints: suffixIconConstraints,
          floatingLabelBehavior: floatingLabelBehavior,
          alignLabelWithHint: true,
          helperText: helperText,
          hintStyle: hintStyle,
          enabledBorder: enabledBorder,
        ),
        validator: validator,
        canRequestFocus: canRequestFocus,
        mouseCursor: mouseCursor,
        onTapOutside: (value) => onTapOutside ?? context.unFocusKeyboard(),
        onTap: onTap,
      ),
    );
  }
}
