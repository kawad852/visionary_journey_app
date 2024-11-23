import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:visionary_journey_app/models/order/order_model.dart';
import 'package:visionary_journey_app/screens/card/widgets/driver_info.dart';
import 'package:visionary_journey_app/screens/card/widgets/location_info.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/editors/text_editor.dart';
import 'package:visionary_journey_app/widgets/help_bubble.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

import '../../../network/my_fields.dart';

class ReviewCard extends StatelessWidget {
  final OrderModel order;

  const ReviewCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HelpBubble(),
        Container(
          width: double.infinity,
          height: 410,
          decoration: BoxDecoration(
            color: context.colorPalette.black1D,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              DriverInfo(
                driver: order.driver!,
              ),
              Container(
                width: double.infinity,
                height: 306,
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                decoration: BoxDecoration(
                  color: context.colorPalette.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    LocationInfo(
                      pickLabelText: order.pickUpNameEn!,
                      arrivalLabelText: order.arrivalNameEn!,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        //unratedColor: context.colorPalette.black1D,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemBuilder: (context, _) => const Icon(Icons.star_rounded),
                        itemSize: 35,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                        onRatingUpdate: (rating) {
                          debugPrint(rating.toString());
                        },
                      ),
                    ),
                    TextEditor(
                      initialValue: null,
                      hintText: context.appLocalization.writeComment,
                      maxLines: 3,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 10),
                    StretchedButton(
                      onPressed: () {
                        context.userProvider.userDocRef.update({
                          MyFields.orderId: null,
                        });
                      },
                      child: Text(
                        context.appLocalization.submitReview,
                        style: TextStyle(
                          color: context.colorPalette.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
