import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Detail%20Resep/dbDetailResep.dart';
import 'package:http/http.dart' as http;

class norm extends StatefulWidget {
  norm({Key key, this.title}) : super(key: key);

  final String title;

  TextEditingController conwkwk = new TextEditingController();

  @override
  _normState createState() => _normState();
}

class _normState extends State<norm> {
  Future<List> getData() async{
    final response= await http.get("http://192.168.43.222/silk2021/slim/public/rekammds/");
    return jsonDecode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text(widget.title),
        ),
        body: new FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot){
              if(snapshot.hasError)print(snapshot.error);

              return snapshot.hasData
                  ? new ItemList(list: snapshot.data,)
                  : new Center(child: new CircularProgressIndicator(),);
            }
        )
    );
  }
}

class ItemList extends StatelessWidget{
  List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Text(list[i]['no_rm']);
      },
    );
  }
}