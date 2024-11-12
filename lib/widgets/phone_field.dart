import 'package:flutter/material.dart';
import 'package:visionary_journey_app/controllers/phone_controller.dart';
import 'package:visionary_journey_app/helper/validation_helper.dart';
import 'package:visionary_journey_app/models/country/country_model.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/my_icons.dart';
import 'package:visionary_journey_app/widgets/countries_bottomsheet.dart';
import 'package:visionary_journey_app/widgets/custom_svg.dart';
import 'package:visionary_journey_app/widgets/editors/base_editor.dart';

class PhoneField extends StatefulWidget {
  final PhoneController controller;
  final bool required;

  const PhoneField({
    super.key,
    required this.controller,
    this.required = true,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late PhoneController _controller;

  void _showCountriesSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (BuildContext context) {
        return const CountriesBottomSheet();
      },
    ).then((value) {
      if (value != null) {
        final countryModel = value as CountryModel;
        setState(() {
          _controller.countryCode = countryModel.code;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BaseEditor(
        initialValue: _controller.phoneNum,
        fillColor: Colors.white,
        filled: true,
        textDirection: TextDirection.ltr,
        onChanged: (value) {
          if (value.isEmpty) {
            _controller.phoneNum = null;
          } else {
            _controller.phoneNum = value;
          }
        },
        hintText: context.appLocalization.phoneNum,
        keyboardType: TextInputType.phone,
        required: widget.required,
        validator: (value) {
          if (!widget.required && (value == null || value.isEmpty)) {
            return null;
          }
          return ValidationHelper.general(context, value);
        },
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: TextButton.icon(
            onPressed: () {
              _showCountriesSheet(context);
            },
            label: Text(_controller.getDialCode()),
            icon: const Row(
              children: [
                CustomSvg(MyIcons.person),
                Icon(Icons.arrow_drop_down_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
