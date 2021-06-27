import 'package:flutter/material.dart';
import 'package:toko_bangunan/ui/entryform.dart';
import 'package:toko_bangunan/models/contact.dart';
import 'package:toko_bangunan/helpers/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
//untuk memanggil fungsi yg terdapat di daftar pustaka sqflite
import 'dart:async';
//pendukung program asinkron

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Contact> contactList;

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = <Contact>[];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pembelian Barang'),
        backgroundColor: Colors.purple
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        backgroundColor: Colors.purple,
        onPressed: () async {
          var contact = await navigateToEntryForm(context, null);
          if (contact != null) addContact(contact);
        },
      ),
    );
  }

  Future<Contact> navigateToEntryForm(BuildContext context, Contact contact) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(contact);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.people),
            ),
            title: Text(
              this.contactList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.contactList[index].jumlah),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () {
                Future<bool> _onDeletePressed() {
                  return showDialog(
                      context: context,
                      builder: (context) => AltertDialog(
                            title: Text("Yakin Ingin Menghapus?"),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text("No"),
                              ),
                              FlatButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text("Yes"),
                              ),
                            ],
                          ));
                }

                deleteContact(contactList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, this.contactList[index]);
              if (contact != null) editContact(contact);
            },
          ),
        );
      },
    );
  }

  //buat contact
  void addContact(Contact object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  //edit contact
  void editContact(Contact object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  //delete contact
  void deleteContact(Contact object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  //update contact
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = dbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }

  AltertDialog({Text title, List<Widget> actions}) {}
}
