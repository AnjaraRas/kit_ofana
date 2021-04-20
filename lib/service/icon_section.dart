import 'package:flutter/material.dart';
import 'package:kit_ofana/screen/diangana.dart';
import 'package:kit_ofana/utils/constant.dart';

class IconSection extends StatelessWidget {
  IconSection({@required this.titre, this.icond, this.couleur, @required type});

  final titre;
  final icond;
  final couleur;
  String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0),
          child: IconButton(
            icon: Icon(
              icond,
              color: Colors.white,
            ),
            onPressed: (){
              selectType = type;
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Diangana()),
              );
            },
          ),
          decoration: BoxDecoration(
            color: couleur,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Text(titre),
      ],
    );
  }
}