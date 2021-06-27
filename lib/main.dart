import 'package:flutter/material.dart';
import 'package:toko_bangunan/login/auth.dart';
import 'beranda.dart' as beranda;
import 'package:toko_bangunan/screens/homepage.dart' as listproduk;
import 'ui/home.dart' as Home;

void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    home: new MyApp(), //LoginApp
  ));
}
  
class MyApp extends StatefulWidget {
  @override
 
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new beranda.Beranda(),
            new listproduk.HomePage(),
            new Home.Home(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.purple,
          child: new TabBar(controller: controller, tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.add_chart))
          ]),
        ));
  }
 

}

