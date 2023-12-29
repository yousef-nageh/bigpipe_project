class FavoritesModel{
bool ?status;
FavoritesData? data;
FavoritesModel.fromJson(Map<String,dynamic> json){
  status=json["status"];
  data=FavoritesData.fromJson(json["data"]);
}
}
class FavoritesData{
int? current_page;
List<FavoritesDataList>?data;
FavoritesData.fromJson(Map<String,dynamic> json){
  current_page=json["current_page"];
  data=[];
  json["data"].forEach((element) {
    data?.add(FavoritesDataList.fromJson(element));
  });
}
}
class FavoritesDataList{
  int? id;
  FavoritesDataProduct ?product;
  FavoritesDataList.fromJson(Map<String,dynamic> json){
    id=json["id"];
    product=FavoritesDataProduct.fromJson(json["product"]);



  }
}
class FavoritesDataProduct{
int? id;
num ?price;
num ?old_price;
num ?discount;
String ?image;
String ?name;
String ?description;
FavoritesDataProduct.fromJson(Map<String,dynamic> json){
  id=json["id"];
  price=json["price"];
  old_price=json["old_price"];
  discount=json["discount"];
  image=json["image"];
  name=json["name"];
  description=json["description"];


}
}
