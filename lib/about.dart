import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            child: Image.asset(
              "assets/images/about.jpg",
            ),
          ),
          Container(
            child: Text(
              "Layanan Aplikasi Yang Memberikan Kemudahan Bagi Pengguna Dalam Menemukan Bahan Bangunan Yang Akan Dibeli Dengan Mudah dan Cepat. Tersedia Banyak Promo Tiap Bulannya.",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
