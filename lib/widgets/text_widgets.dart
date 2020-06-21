import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../dimens.dart';

class TitleMedium extends StatelessWidget {
  TitleMedium(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.archivoBlack(fontSize: fontMedium),
    );
  }
}
