import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kit_ofana/main.dart';
import 'package:kit_ofana/utils/constant.dart';
import 'package:kit_ofana/db/database.dart';

class DetailOfana extends StatefulWidget {
  @override
  _DetailOfanaState createState() => _DetailOfanaState();
}

class _DetailOfanaState extends State<DetailOfana> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.white,
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
        title: Center(child: Text(
          'KitOfana',
          style: GoogleFonts.raleway(color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert, color: Colors.white),
            tooltip: 'Show Snackbar',
            onPressed: () {}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: primaryColor,
            child: Container(
            margin: EdgeInsets.only(top:100.0),
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: FutureBuilder(
              future:  DBProvider.db.getOfana(selectID),
              builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  String titre = snapshot.data[index]['titre'].toString();
                  String vht1 = snapshot.data[index]['vht1'].toString();
                  String vht2 = snapshot.data[index]['vht2'].toString();
                  String vht3 = snapshot.data[index]['vht3'].toString();
                  String votoatiny = snapshot.data[index]['votoatiny'].toString();
                  int id = snapshot.data[index]['id'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height: 40),
                    Container(
                      child: Text(titre, style: GoogleFonts.comfortaa(textStyle: TextStyle(fontSize: 25.0)),)
                    ),
                    SizedBox(height: 20),
                    Text('V.H.T:', style: GoogleFonts.overpass(textStyle: TextStyle(fontWeight: FontWeight.bold)),),
                    Text('1- '+vht1),
                    Text('2- '+vht2),
                    Text('3- '+vht3),
                    SizedBox(height: 10),
                    Text('Votoatiny:', style: GoogleFonts.overpass(textStyle: TextStyle(fontWeight: FontWeight.bold)),),
                    Text(votoatiny),
                    SizedBox(height: 10),
                    Text('Support:', style: GoogleFonts.overpass(textStyle: TextStyle(fontWeight: FontWeight.bold)),),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.file_present, color: Colors.teal,),
                        title: Text(titre+'.pdf'),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download,  color: Color(0xFFFF997A)),
                          onPressed: (){},
                        ),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.theaters_rounded, color: Colors.purple,),
                        title: Text(titre+'.mp4'),
                        trailing: IconButton(
                          icon: Icon(Icons.file_download,  color: Color(0xFFFF997A)),
                          onPressed: (){},
                        ),
                      ),
                    ),
                ],
                );
                }
              );
            },
            ),
          ),
        ),
      ),
    );
  }
}