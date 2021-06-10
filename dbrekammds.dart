import 'dart:async';
import 'dart:convert';

import 'package:flutter_silk/Farmasi/Obat/addObat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/updateObat.dart';
import 'package:flutter_silk/Rekam_Medis/updaterekammds.dart';
import 'package:http/http.dart' as http;

class dbrekammds extends StatefulWidget {
  List list;
  int index;
  dbrekammds({Key key, this.title, this.list, this.index}) : super(key: key);

  final String title;

  @override
  _dbrekammdsState createState() => _dbrekammdsState();
}

class _dbrekammdsState extends State<dbrekammds> {
  final _formKey = GlobalKey<FormState>();

  Future<List> getData() async{
    final response= await http.get("http://10.0.2.2/silk2021/flutter_silk/lib/Rekam_Medis/crud/getrekammds.php");
    return jsonDecode(response.body);
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddObat(title: "Input Data Rekammds"))
                ).then(onGoBack);
              }
          ),
        ],
      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center( child: new CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget{

  //final List list;
  var list;
  int index;
  ItemList({this.list});
  var widget;

  void deleterekammds(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Rekam_Medis/crud/deleterekammds.php";
    http.post(url, body: {
      'no_rm': widget.list[widget.index]['no_rm']
    });
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: list==null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['no_rm'] + " || Keluhan : ${list[i]['keluhan']}"),
                leading: new Icon(Icons.widgets),
                subtitle: new Text("Id Dokter : ${list[i]['id_dokter'] + " || diagnosa : ${list[i]['diagnosa'] + " || Id Unit : ${list[i]['id_unit'] + " || Id Resep : ${list[i]['id_resep'] + " ||"}"}"}"}"),
                onLongPress: (){
                  showDialog(
                      context: context,
                      builder: (_) => new AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            FlatButton(
                              child: Text("Update"),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>updaterekammds(title: "Update Rekammds", list: list, index: i,)
                                  ),
                                );//.then(onGoBack);
                              },
                            ),
                            Divider(
                              color: Colors.black,
                              height: 20,
                            ),
                            FlatButton(
                              child: Text("Delete"),
                              onPressed: () {
                                //deleteo
                                //delData();
                                // Navigator.pop(context);
                                // setState(() {});
                              },
                            )
                          ],
                        ),
                      )
                  );
                },
              ),
            ),
          );
        }
    );
  }
}