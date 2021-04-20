import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kit_ofana/screen/detailofana.dart';
import 'package:kit_ofana/utils/constant.dart';
import 'package:kit_ofana/db/database.dart';

class ListOfana extends StatefulWidget {
  ListOfana({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListOfanaState createState() => _ListOfanaState();
}
class _ListOfanaState extends State<ListOfana> {

  getTasks() async{
    final tasks = await DBProvider.db.getAllOfana();
    return tasks;
  }

  String sampanaColor;
  Color getColorSampana(sampanaColor){
    if(sampanaColor == 'Mavo'){
      return sampanaColor = Color(0xFFFFE226);
    }else if(sampanaColor == 'Maitso'){
      return sampanaColor = Color(0xFF3DAD21);
    }else if(sampanaColor == 'Mena'){
      return sampanaColor = Color(0xFFF5301F);
    }else if(sampanaColor == 'Menafify'){
      return sampanaColor = Color(0xFF780B30);
    }else{
      return sampanaColor = notifColor;
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future:  DBProvider.db.getAllOfana(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                String titre = snapshot.data[index]['titre'].toString();
                String sampana = snapshot.data[index]['sampana'].toString();
                String type = snapshot.data[index]['type'].toString();
                int id = snapshot.data[index]['id'];
                return Card(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.bookmark, color: getColorSampana(sampana), size: 34.0,),
                      title: Text(titre, style: GoogleFonts.comfortaa(
                        textStyle: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      subtitle: Text(
                        'Sampana: '+sampana+' | '+type,
                        style: TextStyle(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: Row(
                            children: [
                              Icon(Icons.remove_red_eye, color: sucsessColor,),
                              Text('Jerena', style: TextStyle(color: sucsessColor),),
                            ],
                          ),
                          onPressed: () {
                            setState(() {
                              selectID = id;
                            });
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DetailOfana()),
                            );
                          },
                        ),
                        SizedBox(width: 10),
                        // TextButton(
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.delete, color: deleteColor,),
                        //       Text('Fafana', style: TextStyle(color: deleteColor),),
                        //     ],
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       DBProvider.db.delete(id);
                        //     });
                        //   },
                        // ),
                      ],
                    ),
                  ]),
                );
              }
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}