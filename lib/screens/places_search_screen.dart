import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/google_places/google_places_details_model.dart';
import '../../models/google_places/google_places_model.dart';
import '../../network/api_service.dart';
import '../../utils/app_constants.dart';
import '../../utils/base_extensions.dart';
import '../alerts/errors/app_error_widget.dart';
import '../utils/my_icons.dart';
import '../widgets/custom_future_builder.dart';
import '../widgets/custom_svg.dart';
import '../widgets/editors/base_editor.dart';
import '../widgets/fire_animated_search_bar.dart';

class PlacesSearchScreen extends StatefulWidget {
  final Future Function(double lat, double lng, String? name) callBack;
  final String labelText;

  const PlacesSearchScreen({
    super.key,
    required this.callBack,
    required this.labelText,
  });

  @override
  State<PlacesSearchScreen> createState() => _PlacesSearchScreenState();
}

class _PlacesSearchScreenState extends State<PlacesSearchScreen> {
  late Future<GooglePlacesModel> _searchFuture;

  void _initialize(String value) {
    if (value.isEmpty) {
      _searchFuture = Future.value(GooglePlacesModel());
      return;
    }
    _searchFuture = _fetchPlaces(value);
  }

  Future<GooglePlacesModel> _fetchPlaces(String query) async {
    return await ApiService.build<GooglePlacesModel>(
      callBack: () async {
        var response =
            await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&components=country:JO&country=us&key=$kGoogleMapKey'));
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonResponse = json.decode(response.body);
          var googlePlacesModel = GooglePlacesModel.fromJson(jsonResponse);
          // debugPrint("GooglePlacesModel::: ${googlePlacesModel.toJson()}");
          return googlePlacesModel;
        } else {
          debugPrint("GooglePlacesError::: ${response.statusCode} ${response.body}");
          return null;
        }
      },
    );
  }

  Future<void> _getPlaceDetails(
    BuildContext context,
    String placeId,
    String name,
  ) async {
    return await ApiService.fetch(
      context,
      callBack: () async {
        var response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$kGoogleMapKey'));
        if (response.statusCode == 200) {
          Map<String, dynamic> jsonResponse = json.decode(response.body);
          var googlePlaceDetailsModel = GooglePlaceDetailsModel.fromJson(jsonResponse);
          debugPrint("GooglePlaceDetailsModel::: ${googlePlaceDetailsModel.toJson()}");
          if (context.mounted) {
            widget.callBack(googlePlaceDetailsModel.result!.geometry!.location!.lat!, googlePlaceDetailsModel.result!.geometry!.location!.lng!, name);
          }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FireAnimatedSearchBar(
      hintText: context.appLocalization.placesSearchHint,
      onChanged: (value, onRebuild) {
        onRebuild(() {
          _initialize(value);
        });
      },
      builder: (context, controller) {
        return BaseEditor(
          initialValue: null,
          filled: true,
          readOnly: true,
          onTap: () {
            controller.openView();
          },
          fillColor: context.colorPalette.greyFB,
          hintText: widget.labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorPalette.borderColor),
          ),
          prefixIcon: const IconButton(
            onPressed: null,
            icon: CustomSvg(MyIcons.location),
          ),
          onChanged: (value) {},
        );
      },
      resultsBuilder: (context, query) {
        if (query.isEmpty) {
          return const SizedBox.shrink();
        }
        return CustomFutureBuilder(
          future: _searchFuture,
          onComplete: (context, snapshot) {
            final predictions = snapshot.data!.predictions!;
            if (predictions.isEmpty) {
              return const SizedBox.shrink();
            }
            return SingleChildScrollView(
              child: Column(
                children: List.generate(
                  predictions.length,
                  (int index) {
                    final element = predictions[index];
                    return ListTile(
                      onTap: () {
                        _getPlaceDetails(context, element.placeId!, element.description!).then((value) {
                          Navigator.pop(context);
                        });
                      },
                      leading: const Icon(Icons.location_on),
                      title: Text(element.description!),
                    );
                  },
                ),
              ),
            );
          },
          onError: (error) {
            return AppErrorWidget(
              error: error,
              onRetry: () {
                setState(() {
                  _initialize('');
                });
              },
            );
          },
        );
      },
    );
  }
}
