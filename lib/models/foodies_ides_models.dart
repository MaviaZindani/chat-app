class FoodiesIdesModels {
  String? cheatid;
  String? img;
  String? email;
  String? name;
  String? number;

  FoodiesIdesModels({this.cheatid,this.email,this.img,this.name,this.number});

factory FoodiesIdesModels.fromMap(Map<String,dynamic> id){
  return FoodiesIdesModels(img: id['img'],name: id['name'],number: id['number'],email: id['email'],cheatid: id['cheatid']);
 }
}

class FoodiesDataModels {
  List<FoodiesIdesModels>? mambers;
  FoodiesDataModels({this.mambers});
   factory FoodiesDataModels.fromMap(Map<String,dynamic> id){
  return FoodiesDataModels(mambers: List<FoodiesIdesModels>.from(id['itdNames'].map((i) => FoodiesIdesModels.fromMap(i)).toList()));
}
}