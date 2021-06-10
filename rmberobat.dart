import 'package:flutter/material.dart';
import 'package:flutter_silk/Rekam_Medis/rekam_medis.dart';

class rmberobat extends StatefulWidget {
  rmberobat({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _rmberobatState createState() => _rmberobatState(title);
}

class _rmberobatState extends State<rmberobat> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();
  final String title;
  var url = "http://192.168.43.222/silk2021/slim/public/rekammds/";

  _rmberobatState(this.title);

  bool isLoading = false;
  int _counter = 0;
  String valueChoose;
  List id_dokter = [
    "Cek Kesehatan", "Perawatan gigi", "Perawatan Mata", "Kardiologi"
  ];
  TextEditingController controllerNama= new TextEditingController();
  TextEditingController controllerAlamat= new TextEditingController();
  TextEditingController controllerTanggalberobat= new TextEditingController();
  TextEditingController controllerJamberobat= new TextEditingController();



  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: Container(
        height: 200.0,
        child: Column(
          children: <Widget>[
            Text("Nama: ${controllerNama.text}"),
            Text("Alamat: ${controllerAlamat.text}"),
            Text("TanggalBerobat : ${controllerTanggalberobat.text}"),
            Text("JamBerobat: ${controllerJamberobat.text}"),


          ],
        ),
      ),
    );
    showDialog(context: context,child:alertDialog );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "list view Builder",
          style:  TextStyle(fontSize: 19.0),
        ),
        backgroundColor: Colors.deepPurple,

        actions: <Widget>[
          IconButton(
              icon:  Icon(Icons.add),
              onPressed: ()=>debugPrint("Add")
          ),
          IconButton(
              icon:  Icon(Icons.search),
              onPressed: ()=>debugPrint("Search")
          )
        ],

      ),
      body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:  Column(
                  children: <Widget>[
                    TextField(
                      controller: controllerNama,
                      decoration: InputDecoration(
                          hintText: "Nama",
                          labelText: "Nama",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),

                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      controller: controllerAlamat,
                      decoration: InputDecoration(
                          hintText: "Alamat",
                          labelText: "Alamat",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),

                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      controller: controllerTanggalberobat,
                      decoration: InputDecoration(
                          hintText: "Tanggal Berobat",
                          labelText: "Tanggal Berobat",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),

                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    TextField(
                      maxLines: 3,
                      controller: controllerJamberobat,
                      decoration: InputDecoration(
                          hintText: "Jam Berobat",
                          labelText: "Jam Berobat",
                          border: OutlineInputBorder(
                              borderRadius:  BorderRadius.circular(20.0)
                          )
                      ) ,
                    ),
                    Padding(padding: new EdgeInsets.only(top: 5.0),),
                    DropdownButton(
                      hint: Text("Pilih Poli: "),
                      dropdownColor: Colors.white,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 20,
                      isExpanded: true,
                      underline: SizedBox(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: id_dokter.map((valueItem){
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),

                    )

                  ],

                ),
              ),
            ),

            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              color: Colors.purple,
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rekam_medis(title: "rekam medis")),

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
          ]
      ),

    );

  }
}