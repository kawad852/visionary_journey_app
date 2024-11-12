import 'package:flutter/material.dart';
import 'package:visionary_journey_app/helper/validation_helper.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/editors/base_editor.dart';

class PasswordEditor extends StatefulWidget {
  final String? initialValue;
  final Function(String?) onChanged;
  final bool withErrorIndicator;
  final bool isConfirm;
  final String? password;
  final String? title;

  const PasswordEditor({
    super.key,
    required this.onChanged,
    required this.initialValue,
    this.withErrorIndicator = true,
    this.isConfirm = false,
    this.password,
    this.title,
  });

  @override
  State<PasswordEditor> createState() => _PasswordEditorState();
}

class _PasswordEditorState extends State<PasswordEditor> {
  final bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      initialValue: widget.initialValue,
      obscureText: _obscureText,
      obscuringCharacter: "●",
      style: const TextStyle(fontSize: 15),
      required: true,
      fillColor: Colors.white,
      filled: true,
      prefixIcon: const IconButton(
        onPressed: null,
        icon: CustomSvg(MyIcons.lock),
      ),
      autoValidateMode:
          widget.isConfirm ? null : AutovalidateMode.onUserInteraction,
      hintText: "Password",
      // suffixIcon: IconButton(
      //   onPressed: () {
      //     setState(() {
      //       _obscureText = !_obscureText;
      //     });
      //   },
      //   icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
      // ),
      onChanged: (value) {
        if (value.isEmpty) {
          widget.onChanged(null);
        } else {
          widget.onChanged(value);
        }
        if (widget.isConfirm) {
          setState(() {});
        }
      },
      validator: (value) {
        if (widget.isConfirm) {
          return widget.password == value ? null : "password Does not Match";
        }
        return ValidationHelper.password(context, value);
      },
    );
  }
}
