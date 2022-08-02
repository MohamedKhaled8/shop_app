
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtiles extends StatelessWidget {
  const TextUtiles(  {
    Key? key,
    required this.text,
    required this.underline,
    required this.color,
    required this.fontsize,
    required this.fontWeight,  
    
  }) : super(key: key);

  final String text;
  final TextDecoration underline;
  final Color color;

  final double fontsize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.lato(
            textStyle: TextStyle(
              decoration: underline,
          color: color,
          fontSize: fontsize,
          fontWeight: fontWeight,
        )));
  }
}
