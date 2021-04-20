import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kit_ofana/models/ofana.dart';
import 'package:kit_ofana/db/database.dart';
// import 'package:kit_ofana/db/repository_service_ofana.dart';
import 'package:kit_ofana/utils/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kit_ofana/main.dart';

class CreateOfana extends StatefulWidget {
  CreateOfana({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateOfanaState createState() => _CreateOfanaState();
}

class _CreateOfanaState extends State<CreateOfana> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController inputTitreController = TextEditingController();
  TextEditingController inputVht1Controller = TextEditingController();
  TextEditingController inputVht2Controller = TextEditingController();
  TextEditingController inputVht3Controller = TextEditingController();
  TextEditingController inputSampanaController = TextEditingController();
  TextEditingController inputVotoatinyController = TextEditingController();
  TextEditingController inputTypeController = TextEditingController();
  String titre = "";
  String vht1 = "";
  String vht2 = "";
  String vht3 = "";
  String type = "";
  String sampana = "";
  String votoatiny = "";
  int id;

  @override
  // initState() {
  //   super.initState();
  //   future = DBProvider.db.getAllOfana();
  // }

  // void readData() async {
  //   final ofana = await DBProvider.db.getOfana(id);
  //   print(ofana.titre);
  // }

  // updateOfana(Ofana ofana) async {
  //   ofana.titre = 'please 🤫';
  //   await DBProvider.db.updateOfana(ofana);
  //   setState(() {
  //     future = DBProvider.db.getAllOfana();
  //   });
  // }

  // deleteOfana(Ofana ofana) async {
  //   await DBProvider.db.deleteOfana(ofana);
  //   setState(() {
  //     id = null;
  //     future = DBProvider.db.getAllOfana();
  //   });
  // }

  // Card buildItem(Ofana ofana) {
  //   return Card(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text(
  //             'Titre: ${ofana.titre}',
  //             style: TextStyle(fontSize: 24),
  //           ),
  //           Text(
  //             '1- ${ofana.vht1}',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           Text(
  //             '2- ${ofana.vht2}',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           Text(
  //             '3- ${ofana.vht3}',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           Text(
  //             'v  ${ofana.votoatiny}',
  //             style: TextStyle(fontSize: 20),
  //           ),
  //           SizedBox(height: 12),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: <Widget>[
  //               FlatButton(
  //                 onPressed: () => updateOfana(ofana),
  //                 child: Text('Update todo', style: TextStyle(color: Colors.white)),
  //                 color: Colors.green,
  //               ),
  //               SizedBox(width: 8),
  //               FlatButton(
  //                 onPressed: () => deleteOfana(ofana),
  //                 child: Text('Delete'),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

      
  // TextFormField buildTextFormField() {
  //   return InputTextOfana(variable: titre, hintText: 'Lohahevitra');
  // }

  void createOfana() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await DBProvider.db.ofanaCount();
      setState(() {
        titre = inputTitreController.text.toString();
        vht1 = inputVht1Controller.text.toString();
        vht2 = inputVht2Controller.text.toString();
        vht3 = inputVht3Controller.text.toString();
        type = inputTypeController.text.toString();
        sampana = inputSampanaController.text.toString();
        votoatiny = inputVotoatinyController.text.toString();

        inputTitreController.text = "";
        inputVht1Controller.text = "";
        inputVht2Controller.text = "";
        inputVht3Controller.text = "";
        inputTypeController.text = "";
        inputSampanaController.text = "";
        inputVotoatinyController.text = "";
      });
      Ofana ofana = Ofana(titre: titre, vht1: vht1, vht2: vht2, vht3: vht3, type: type, sampana: sampana, votoatiny: votoatiny, isDeleted: false);
      // Ofana ofana = Ofana(count, titre, vht1, vht2, vht3, type, sampana, votoatiny, false);
      // Task newTask = Task(task: newTaskTxt, dateTime: DateTime.now());
      await DBProvider.db.addOfanaNew(ofana);
      setState(() {
        id = ofana.id;
        // future = DBProvider.db.getOfanaPlus();
      });
      print(ofana.id);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Fanamboarana ofana',
          style: GoogleFonts.raleway(color: textColor),
        ),
        elevation: 0.0,
      ),
      body: Container(
        color: primaryColor,
        child: Container(
          margin: EdgeInsets.only(top:75.0),
            padding: EdgeInsets.all(15.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
          child: ListView(
            padding: EdgeInsets.all(8),
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputTextOfana(variable: titre, hintText: 'Lohahevitra', inputController: inputTitreController),
                    SizedBox(height: 8),
                    InputTextOfana(variable: vht1, hintText: 'V.H.T (1)', inputController: inputVht1Controller),
                    SizedBox(height: 8),
                    InputTextOfana(variable: vht2, hintText: 'V.H.T (2)', inputController: inputVht2Controller),
                    SizedBox(height: 8),
                    InputTextOfana(variable: vht3, hintText: 'V.H.T (3)', inputController: inputVht3Controller),
                    SizedBox(height: 8),
                    InputTextOfana(variable: type, hintText: 'Fanomanana, Fanaterana, Ravinala,...', inputController: inputTypeController),
                    SizedBox(height: 8),
                    InputTextOfana(variable: sampana, hintText: 'Mavo, Maitso, Mena, Menafify', inputController: inputSampanaController),
                    SizedBox(height: 8),
                    InputTextOfana(variable: votoatiny, hintText: 'Votoatiny', inputController: inputVotoatinyController),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: createOfana,
                    child: Text('Alefa', style: TextStyle(color: Colors.white)),
                    color: sucsessColor,
                    elevation: 0.0,
                  ),
                  // RaisedButton(
                  //   onPressed: id != null ? readData : null,
                  //   child: Text('Read', style: TextStyle(color: Colors.white)),
                  //   color: blueColor,
                  // ),
                ],
              ),
              // FutureBuilder<List<Ofana>>(
              //   future: future,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Column(children: snapshot.data.map((ofana) => buildItem(ofana)).toList());
              //     } else {
              //       return SizedBox();
              //     }
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }

  String randomOfana() {
    final randomNumber = Random().nextInt(4);
    String ofana;
    switch (randomNumber) {
      case 1:
        ofana = 'Like and subscribe 💩';
        break;
      case 2:
        ofana = 'Twitter @robertbrunhage 🤣';
        break;
      case 3:
        ofana = 'Patreon in the description 🤗';
        break;
      default:
        ofana = 'Leave a comment 🤓';
        break;
    }
    return ofana;
  }
}

class InputTextOfana extends StatelessWidget {
  InputTextOfana({@required this.variable, @required this.hintText, @required this.inputController});

  String hintText;
  String variable;
  TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: inputController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        labelText: hintText,
        labelStyle: TextStyle(
          color: sencondaryColor
        ),                                                                                                 
        // fillColor: sencondaryColor,
        filled: true,
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Omeo lohahevitra ny ofana...';
      //   }
      // },
      onSaved: (value) => variable = value,
    );
  }
}