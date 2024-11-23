import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visionary_journey_app/helper/ui_helper.dart';
import 'package:visionary_journey_app/models/country/country_model.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/utils/countries.dart';
import 'package:visionary_journey_app/widgets/editors/base_editor.dart';

class CountriesBottomSheet extends StatefulWidget {
  const CountriesBottomSheet({super.key});

  @override
  State<CountriesBottomSheet> createState() => _CountriesBottomSheetState();
}

class _CountriesBottomSheetState extends State<CountriesBottomSheet> {
  String? query;
  late List<CountryModel> countries;
  CountryModel? countryModel;
  Timer? _debounce;

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isEmpty) {
        setState(() {
          countries = kCountries;
        });
      } else {
        setState(() {
          countries = kCountries.where((element) {
            return element.nameEn!.toLowerCase().contains(query.toLowerCase()) || element.dialCode!.contains(query) || element.nameAr!.contains(query);
          }).toList();
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    countries = List<CountryModel>.from(countriesList.map((model) => CountryModel.fromJson(model)));
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BaseEditor(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          prefixIcon: const Icon(Icons.search),
          hintText: context.appLocalization.searchCountryOrCode,
          onChanged: _onSearchChanged,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: countries.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemBuilder: (context, index) {
              final country = countries[index];
              return ListTile(
                onTap: () {
                  countryModel = CountryModel.fromJson(country.toJson());
                  Navigator.pop(context, countryModel);
                },
                leading: SvgPicture.asset(
                  UiHelper.getFlag(country.code!),
                  width: 30,
                ),
                title: Text(
                  context.translate(textEN: country.nameEn!, textAR: country.nameAr!),
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(country.dialCode!),
              );
            },
          ),
        ),
      ],
    );
  }
}
