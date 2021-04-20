import 'package:flutter/material.dart';
import 'package:kit_ofana/utils/constant.dart';

class Boxprimary extends StatelessWidget {
  const Boxprimary({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150.0,
        width: double.infinity,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'Faritany Analamanga Avaratra',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Ofana fanampiana an\'ireo mpiandraikitra',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      );
  }
}