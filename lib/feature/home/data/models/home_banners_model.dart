class BannersModel{
bool ?status;
List<BannersData> ?data;
BannersModel.fromJson(Map<String,dynamic> json){
  status=json['status'];
  data=[];
 json['data'].forEach((element) {
    data?.add(BannersData.fromJson(element));
  });
}
}
class BannersData{
  int ?id;
  String ?image;
  BannersData.fromJson(Map<String,dynamic> json){
    id=json['id'];
    image=json['image'];
  }
}