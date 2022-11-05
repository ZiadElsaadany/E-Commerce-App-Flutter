/// id : 11
/// image : "https://student.valuxapps.com/storage/uploads/banners/1619472351ITAM5.3bb51c97376281.5ec3ca8c1e8c5.jpg"
/// category : null
/// product : null

class Banners {
  Banners({
      num? id, 
      String? image, 
      dynamic category, 
      dynamic product,}){
    _id = id;
    _image = image;
    _category = category;
    _product = product;
}

  Banners.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _category = json['category'];
    _product = json['product'];
  }
  num? _id;
  String? _image;
  dynamic _category;
  dynamic _product;
Banners copyWith({  num? id,
  String? image,
  dynamic category,
  dynamic product,
}) => Banners(  id: id ?? _id,
  image: image ?? _image,
  category: category ?? _category,
  product: product ?? _product,
);
  num? get id => _id;
  String? get image => _image;
  dynamic get category => _category;
  dynamic get product => _product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['category'] = _category;
    map['product'] = _product;
    return map;
  }

}