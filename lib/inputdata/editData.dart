import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toko_bangunan/cek.dart';
import 'package:toko_bangunan/ui/datatampil.dart';
import 'package:toko_bangunan/ui/home.dart';

class EditData extends StatelessWidget {
  final Map input;
  EditData({@required this.input});
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  //membuat method POST untuk Upload data ke API
  Future updateKonten() async {
    // karena ingin mengedit data maka menggunakan method PUT maka perlu tambahan body karena di body API kita akan menambahkan data object yang sudah ditulis harus sama dengan yang ada di API
    // dan tambahan pada url yaitu upload ["id"] fungsinya untuk mengetahui id data ke berapa yang diedit pada API
    final response = await http
        .put(Uri.parse("http://192.168.1.108:80/api/products/" + input['id'].toString()), body: {
      "name": nameController.text,
      "price": priceController.text,
      "jumlah": jumlahController.text,
    });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.arrow_back),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: nameController..text = input['name'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Nama Barang",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: priceController..text = input['price'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: TextField(
                  controller: jumlahController..text = input['jumlah'],
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Jumlah",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text(
                          'Update',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (_formkey.currentState.validate()) {
                            updateKonten().then((value) {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => DataTampil()));
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Batal',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
