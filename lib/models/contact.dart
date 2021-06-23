class Contact {
  int _id;
  String _name;
  String _jumlah;
  String _price;

  Contact(this._name, this._jumlah, this._price);
  Contact.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._jumlah = map['jumlah'];
    this._price = map['price'];
  }
  int get id => _id;
  String get name => _name;
  String get jumlah => _jumlah;
  String get price => _price;
  set name(String value) {
    _name = value;
  }

  set jumlah(String value) {
    _jumlah = value;
  }

  set price(String value) {
    _price = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['jumlah'] = jumlah;
    map['price'] = price;
    return map;
  }
}
