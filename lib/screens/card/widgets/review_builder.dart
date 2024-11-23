import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:visionary_journey_app/utils/base_extensions.dart';
import 'package:visionary_journey_app/widgets/editors/text_editor.dart';
import 'package:visionary_journey_app/widgets/stretch_button.dart';

import '../../../network/my_fields.dart';

class ReviewBuilder extends StatelessWidget {
  final double size;
  const ReviewBuilder({super.key, this.size = 35});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            //unratedColor: context.colorPalette.black1D,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemBuilder: (context, _) => const Icon(Icons.star_rounded),
            itemSize: size,
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
    );
  }
}
