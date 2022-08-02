import 'package:flutter/material.dart';
import 'package:st/utils/thems.dart';
import 'package:st/view/widgets/text_utils.dart';

class AuthButtom extends StatelessWidget {
  AuthButtom({
    Key? key,
    required this.txt,
    required this.onTap,
  }) : super(key: key);
final String txt;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, 
    
    style: ElevatedButton.styleFrom(
      primary: mainColor,
       shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
      padding: const EdgeInsets.symmetric(
                              horizontal: 110, vertical: 15),
    ),
    child: 
    TextUtiles(text: txt, underline: TextDecoration.none, color: Colors.white, fontsize: 18, fontWeight: FontWeight.bold)
    );
  }
}
