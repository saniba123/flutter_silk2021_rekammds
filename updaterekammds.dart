import 'package:flutter/material.dart';
import 'package:flutter_silk/Farmasi/Obat/dbObat.dart';
//import 'package:flutter_silk/Farmasi/Resep/dbResep.dart';
import 'package:http/http.dart' as http;

class updaterekammds extends StatefulWidget {
  final List list;
  final int index;
  final String title;

  updaterekammds({Key key, @required this.title, this.list, this.index});

  @override
  _updaterekammdsState createState() => _updaterekammdsState();
}

class _updaterekammdsState extends State<updaterekammds> {

  TextEditingController controllerNo_rm;
  TextEditingController controllerKeluhan;
  TextEditingController controllerId_dokter;
  TextEditingController controllerDiagnosa;
  TextEditingController controllerId_unit;
  TextEditingController controllerTgl_periksa;
  TextEditingController controllerId_resep;

  void editobat(){
    var url="http://10.0.2.2/silk2021/flutter_silk/lib/Rekam_Medis/crud/editrekammds.php";
    http.post(url,body: {
      "no_rm": widget.list[widget.index]['no_rm'],
      "keluhan": controllerKeluhan.text,
      "id_dokter": controllerId_dokter.text,
      "diagnosa": controllerDiagnosa.text,
      "id_unit": controllerId_unit.text,
      "tgl_periksa": controllerTgl_periksa.text,
      "id_resep": controllerId_resep.text
    });
  }

  @override
  void initState() {
    controllerKeluhan = new TextEditingController(text: widget.list[widget.index]['keluhan']);
    controllerId_dokter = new TextEditingController(text: widget.list[widget.index]['id_dokter']);
    controllerDiagnosa = new TextEditingController(text: widget.list[widget.index]['diagnosa']);
    controllerId_unit = new TextEditingController(text: widget.list[widget.index]['id_unit']);
    controllerTgl_periksa = new TextEditingController(text: widget.list[widget.index]['tgl_periksa']);
    controllerId_resep = new TextEditingController(text: widget.list[widget.index]['id_resep']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Edit Rekammds"),),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new TextField(
                    controller: controllerKeluhan,
                    decoration: new InputDecoration(
                        hintText: "keluhan",
                        labelText: "keluhan"
                    ),
                  ),
                  new TextField(
                    controller: controllerId_dokter,
                    decoration: new InputDecoration(
                        hintText: "id dokter",
                        labelText: "id dokter"
                    ),
                  ),
                  new TextField(
                    controller: controllerDiagnosa,
                    decoration: new InputDecoration(
                        hintText: "diagnosa",
                        labelText: "diagnosa"
                    ),
                  ),
                  new TextField(
                    controller: controllerId_unit,
                    decoration: new InputDecoration(
                        hintText: "5",
                        labelText: "id unit"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new TextField(
                    controller: controllerTgl_periksa,
                    decoration: new InputDecoration(
                        hintText: "17/02/21",
                        labelText: "Harga"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new TextField(
                    controller: controllerId_resep,
                    decoration: new InputDecoration(
                        hintText: "id resep",
                        labelText: "id resep"
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(10.0)
                  ),
                  new RaisedButton(
                    child: new Text("Simpan"),
                    color: Colors.blueAccent,
                    onPressed: () {
                      editobat();
                      Navigator.of(context).push(
                          new MaterialPageRoute(
                              builder: (BuildContext context)=> new dbObat(title: "Rekammds")
                          )
                      );
                    },
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}
