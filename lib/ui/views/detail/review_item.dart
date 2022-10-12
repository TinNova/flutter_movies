import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/data/models/mdb_review.dart';

import '../../../colours.dart';
import '../../../dimens.dart';

class ReviewItem extends StatelessWidget {
  final MDBReview review;

  ReviewItem(this.review);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: margin, right: margin, bottom: margin),
      padding: EdgeInsets.only(
          left: marginMediumHalf, right: marginMediumHalf, bottom: marginLarge, top: margin),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColour),
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Center(child: Text(review.content, style: GoogleFonts.archivo(fontSize: fontMedium))),
                margin: EdgeInsets.only(bottom: marginLarge, top: margin)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(review.authorDetails.profilePath),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: marginMediumHalf),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: marginSmall),
                          child: Text(review.authorDetails.username,
                              style: GoogleFonts.archivoBlack(
                                  fontSize: fontMedium, color: primaryColour)),
                        ),
                        Text("Date of Review",
                            style: GoogleFonts.archivo(fontSize: fontMedium, color: primaryColour))
                      ],
                    ),
                  ),
                ],
              ),
              Chip(
                labelPadding: EdgeInsets.only(left: 2.0),
                avatar: Icon(
                  Icons.star_border,
                  color: Colors.white,
                ),
                label: Text(
                  review.authorDetails.rating.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                padding: EdgeInsets.only(left: 2.0, right: 12.0),
                backgroundColor: primaryColour,
              )
            ],
          )
        ],
      ),
    );
  }
}
