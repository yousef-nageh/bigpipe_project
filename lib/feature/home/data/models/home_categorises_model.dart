class CategorisesModel{
bool ?status;
CategorisesData? data;
CategorisesModel.fromJson(Map<String,dynamic> json){
  status=json['status'];
  data=CategorisesData.formJson(json['data']);
}
}
class CategorisesData{

  int? current_page;
  List<CategorisesList> ?data;

  CategorisesData.formJson(Map<String,dynamic> json){

    current_page=json['current_page'];
    data=[];
    json['data'].forEach((element) {
     data?.add(CategorisesList.fromJson(element)) ;
    });


  }

}
class CategorisesList{

  int ? id;
  String? name ;
  String? image ;
  CategorisesList.fromJson(Map<String,dynamic> json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}