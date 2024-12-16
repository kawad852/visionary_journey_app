import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';

import '../../../widgets/editors/base_editor.dart';

class OtpEditor extends StatelessWidget {
  final Function(String? value) onChanged;

  const OtpEditor({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BaseEditor(
      textAlign: TextAlign.center,
      hintText: context.appLocalization.codeHintText,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      onChanged: onChanged,
    );
  }
}
