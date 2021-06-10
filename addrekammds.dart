import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class addrekammds extends StatefulWidget {
  addrekammds({Key key, @required this.title}) : super(key: key);
  final String title;

  @override
  _addrekammdsState createState() => _addrekammdsState(title);
}

class _addrekammdsState extends State<addrekammds> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  _addrekammdsState(this.title);
  bool isLoading = false;

  TextEditingController controllerNo_rm = new TextEditingController();
  TextEditingController controllerKeluhan = new TextEditingController();
  TextEditingController controllerId_dokter = new TextEditingController();
  TextEditingController controllerDiagnosa = new TextEditingController();
  TextEditingController controllerId_unit = new TextEditingController();
  TextEditingController controllerTgl_periksa = new TextEditingController();
  TextEditingController controllerId_resep = new TextEditingController();

  void addrekammds(){
    var url ="http://10.0.2.2/silk2021/flutter_silk/lib/Rekam_Medis/crud/addrekammds.php";

    http.post(url, body: {
      "no_rm": controllerNo_rm.text,
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,

      body: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Form(
                key: _formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerNo_rm,
                      decoration: InputDecoration(
                          labelText: "No Rm",
                          hintText: "No Rm",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerKeluhan,
                      decoration: InputDecoration(
                          labelText: "Keluhan",
                          hintText: "Kel",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerId_dokter,
                      decoration: InputDecoration(
                          labelText: "Id Dokter",
                          hintText: "Id Dokter",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerDiagnosa,
                      decoration: InputDecoration(
                          labelText: "Diagnosa",
                          hintText: "Diagnosa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(height: 15,
                    ),
                    TextFormField(
                      controller: controllerId_unit,
                      decoration: InputDecoration(
                          labelText: "Id Unit",
                          hintText: "Id Unit",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controllerTgl_periksa,
                      decoration: InputDecoration(
                          labelText: "Tgl Periksa",
                          hintText: "Tanggal Periksa",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controllerId_resep,
                      decoration: InputDecoration(
                          labelText: "Id Resep",
                          hintText: "Id Resep",
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0)
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      color: Colors.blue,
                      onPressed: () {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Simpan Data"),
                              content: Text("Apakah Anda akan menyimpan data ini?"),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text("Ya"),
                                  onPressed: () {
                                    addrekammds();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },

                                ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Tidak")
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text(
                        "Simpan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Center(
              //   child: CircularProgressIndicator(),
              // )
              isLoading
                  ? Stack(
                children: <Widget>[
                  // Opacity(
                  //   opacity: 0.3,
                  //   child: ModalBarrier(
                  //     dismissible: false,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              )
                  : Container(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}