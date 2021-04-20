import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kit_ofana/service/diangampiofanana.dart';
import 'package:kit_ofana/service/icon_section.dart';
import 'package:kit_ofana/service/boxprimary.dart';
import 'package:kit_ofana/utils/constant.dart';
import 'package:kit_ofana/screen/loadofana.dart';

class Diangana extends StatefulWidget {
  Diangana({Key key}) : super(key: key);
  @override
  _DianganaState createState() => _DianganaState();
}

class _DianganaState extends State<Diangana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(child: Text(
          'KitOfana - Fanaterana',
          style: GoogleFonts.raleway(color: textColor),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              //
            }
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: floterColor,
        onPressed: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateOfana()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
            child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left:15.0, right: 15.0, bottom: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconSection(titre: 'Fanomanana', icond: Icons.book, couleur: Colors.yellow.shade700, type: 'Fanomanana'),
                    IconSection(titre: 'Fanaterana', icond: Icons.verified, couleur: Colors.blue, type: 'Fanaterana'),
                    IconSection(titre: 'Ravinala', icond: Icons.local_fire_department, couleur: Colors.green, type: 'Ravinala'),
                    IconSection(titre: 'Tovana', icond: Icons.military_tech, couleur: Colors.yellow.shade900, type: 'Tovana'),
                  ],
                ),
              ),
              Diangamiofanana(),
            ],
          ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2.0,
        color: primaryColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.chat),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.person_sharp),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.settings),
              color: Colors.white,
            ),
          ]
        ),
      ),
    );
  }
}
