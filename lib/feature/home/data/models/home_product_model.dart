class ProductModel{
bool ?status;
ProductData? data;

ProductModel.formJson(Map<String,dynamic> json){
  status=json["status"];
  data= json['data'] !=  null? ProductData.formJson(json['data']):null;
}

}
class ProductData{
  String ?ad;
  List<ProductListData>? products;
  ProductData.formJson(Map<String,dynamic> json){
    products=[];
   json["products"].forEach((element) {
      products?.add(ProductListData.formJson(element));
    });
   ad=json["ad"];
  }
}

class ProductListData{
  int ?id;
  num ?price;
  num ?old_price;
  num ?discount;
  String ?image;
  String ?name;
  String ?description;
 List<dynamic >? images;
  bool ?in_favorites;
  bool ?in_cart;
  ProductListData.formJson(Map<String,dynamic> json){
    id=json["id"];
    price=json["price"];
    old_price=json["old_price"];
    discount=json["discount"];
    image=json["image"];
    name=json["name"];
    description=json["description"];
    images=json["images"];
    in_favorites=json["in_favorites"];
    in_cart=json["in_cart"];


  }
}
