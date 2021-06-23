import 'package:flutter/material.dart';
import 'about.dart';

class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('E-Building'),
         ]),
         actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed:(){
                print('Click search');
              },
            ), 
            IconButton(
              icon: Icon(Icons.notifications_active),
              onPressed: (){
                print('Click start');
              },
              )
         ],   
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Adi Hananjoyo"), 
              accountEmail: new Text ("adi.hananjoyo@undiksha.ac.id"),
              currentAccountPicture: new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(
                    'assets/images/anan.jpg'),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new NetworkImage ('https://www.shihoriobata.com/wp-content/uploads/2020/12/moon-and-clouds-aesthetic-background-phone2-576x1024.jpg?x45601'),
                      fit: BoxFit.cover),
                  ),
                ),
            new ListTile(
              title: new Text('Notifications'),
              trailing: new Icon(Icons.notifications_none),
            ),   
            new ListTile(
              title: new Text('Wishlist'),
              trailing: new Icon(Icons.bookmark_border),
            ),
            new ListTile(
             title: new Text('Akun'),
             trailing: new Icon(Icons.verified_user),
           ),
            Divider(height: 2,),
            new ListTile(
             title: new Text('About'),
             trailing: new Icon(Icons.warning_amber_rounded),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext) => About(),
                      ))
          ),
            new ListTile(
             title: new Text('Setting'),
             trailing: new Icon(Icons.settings),
           ),
          ],
        ),
      ),
//seluruh boody dibungkus colomn
      body: new ListView(
        children: <Widget>[
          Image.network ("https://i0.wp.com/bangunin.id/wp-content/uploads/2020/04/tiga-roda.jpg?resize=700%2C688&ssl=1"),
// setiap bagian pada body dipisahkan container
          Container(
            color: Colors.greenAccent[100],
            padding: const EdgeInsets.all(10) ,
            //untuk membuat tampilan secara horisontal maka digunakan row
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rp 50.000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20  ),
                      ),
                      Text(
                        'Points 5.000',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.local_offer,
                  color: Colors.red[500],
                ),
                 Text(' Up 30%'),
              ],
            ),
          ),
 //setiap bagian pada body dipisahkan container
          Container(
            padding: EdgeInsets.only(top:10,bottom: 10),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
            ), 
            //untuk membuat tampilan secara vertikal maka gunakan colomn
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //untuk membuat tampilan vertikal maka digunakan colomn
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.grid_on,color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Semua Kategori",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.green
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment : MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.share, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top:8),
                      child: Text(
                        "Bagikan",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.near_me, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Lokasi",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ), 
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.call, color: Colors.green),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Telepon",
                        style: TextStyle(
                          fontSize : 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.orange, Colors.yellow],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bahan bangunan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      Text(
                        'Diskon up to 30%',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(' Edisi terbatas !'),
              ],
            ),
          )   
        ],
      ),
    );
  }
}
