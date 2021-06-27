import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:toko_bangunan/screens/homepage.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  saveProduct()async{
    final response =
      await http.post(Uri.parse("http://192.168.1.108:80/api/products"),body:{
        "name":_nameController.text,
        "description":_descriptionController.text,
        "price":_priceController.text,
        "image_url":_imageUrlController.text,  
    });
    print(response.body);
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.purple,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText:'Name'),
                validator: (value){
                  if(value ==null || value.isEmpty){
                    return"Please enter product name";
                  }
                  return null;
                },              
              ),
               TextFormField(
                 controller: _descriptionController,
                decoration: InputDecoration(labelText:'Description'),
                 validator: (value){
                  if(value ==null || value.isEmpty){
                    return"Please enter product description";
                  }
                  return null;
                },          
              ),
               TextFormField(
                 controller: _priceController,
                decoration: InputDecoration(labelText:'Price'),
                 validator: (value){
                  if(value ==null || value.isEmpty){
                    return"Please enter product price";
                  }
                  return null;
                },          
              ),
               TextFormField(
                 controller: _imageUrlController,
                decoration: InputDecoration(labelText:'Image URL'),
                 validator: (value){
                  if(value ==null || value.isEmpty){
                    return"Please enter product Image Url";
                  }
                  return null;
                },          
              ),
              SizedBox(height:20,
              ),
              ElevatedButton(
                onPressed: (){
                  if (_formKey.currentState.validate()) {
                    saveProduct().then((value){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) => HomePage()));
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Product berhasil di tambahkan"),));
                                   });                 }
              },
               child: Text("Save"))
            ],
          ),
        ),
    );
  }
}