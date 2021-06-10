import 'package:flutter/material.dart';
import 'package:flutter_silk/Rekam_Medis/rekam_medis.dart';
import 'package:flutter_silk/Rekam_Medis/rekam_medis1.dart';
import 'package:flutter_silk/Rekam_Medis/norm.dart';
import 'package:flutter_silk/Rekam_Medis/rmberobat.dart';


class rekam_medis1 extends StatefulWidget {
  rekam_medis1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _rekam_medis1State createState() => _rekam_medis1State();
}

class _rekam_medis1State extends State< rekam_medis1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Cari No Rm",
                      hintText: "Masukkan No Rm",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Cari Nama ",
                      hintText: "Masukkan Nama ",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                  ),
                ),
                SizedBox(height: 5,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.purple,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => rmberobat(title: "norm")),  //<~~
                    );

                  },
                  child: Text(
                    "cari",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                ),
                SizedBox(height: 5,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.purple,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>rekam_medis(title: "rekam medis")),  //<~~
                    );
                  },
                  child: Text(
                    "List rekammds",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 400,
                ),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  color: Colors.grey,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>rekam_medis(title: "rekam_medis")),  //<~~
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}