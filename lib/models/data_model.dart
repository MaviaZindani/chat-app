import 'package:cheatapp/models/cheat_list_model.dart';

class DataModel {
   String? img;
   String? lastMessage;
   String? name;
   String? timing;
   String? chatid;
   List<CheatListModel>? cheatList;

  DataModel({this.img, this.lastMessage, this.name, this.timing, this.cheatList,this.chatid});

  factory DataModel.fromMap(Map<dynamic, dynamic> map){
    // print(map);
    return DataModel(img: map['img'],timing: map['timing'] ,lastMessage: map['lastMessage'],name: map['name'],chatid: map['chatid'],
    cheatList: List<CheatListModel>.from(map['cheatList'].map((i) => CheatListModel.fromMap(i)).toList()));
  }
}
