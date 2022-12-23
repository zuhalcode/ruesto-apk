class Product {
  late List<ProductModel> _products;
  List<ProductModel> get products => _products;

  Product({required products}) {
    _products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <ProductModel>[];
      json['products'].forEach((v) {
        _products.add(ProductModel.fromJson(v));
      });
    }
  }
}

class ProductModel {
  String? sId;
  String? name;
  int? price;
  String? desc;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  ProductModel(
      {this.sId,
      this.name,
      this.price,
      this.desc,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    price = json['price'];
    desc = json['desc'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }
}
