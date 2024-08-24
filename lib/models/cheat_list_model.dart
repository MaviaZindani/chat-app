class CheatListModel {
   String? text;
   String? user;
   bool? isUserSend;

   CheatListModel({this.text,this.user,this.isUserSend});

 factory CheatListModel.fromMap(Map<dynamic,dynamic> json){
    return CheatListModel(text: json['text'] ?? '',user: json['user']?? 'no user id',isUserSend: json['isUserSend']);
  }
}