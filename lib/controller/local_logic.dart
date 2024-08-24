import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cheatapp/utils/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cheatapp/models/cheat_list_model.dart';

class LocalLogic with ChangeNotifier{
FirebaseAuth auth = FirebaseAuth.instance;
var firebaseFirestore = FirebaseFirestore.instance;


  void navigateFromSplashScreen(BuildContext context){
  Timer(const Duration(seconds: 3), (){
    Navigator.pushNamed(context, RoutesName.introScreen1);
    notifyListeners();
    });
}


void signinMethod(String email,String password,BuildContext context) async{
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
  Navigator.pushNamed(context, RoutesName.homeScreen);
  
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }else{
    print(e.code);
  }
} catch (e) {
  print(e);
}
notifyListeners();
}

void loginMethod(String email,String password,BuildContext context) async{
  try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  Navigator.pushNamed(context, RoutesName.homeScreen);
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }else{
    print(e.code);
  }
}catch (e) {
    print(e);
  }
  notifyListeners();
}

//  void prorifyMessages(String userid) async{
//   Future<QuerySnapshot<Map<String, dynamic>>> messages = FirebaseFirestore.instance.collection('maviazindani')
//     .doc(userid)
//     .collection('chatList')
//     .get();

//     AsyncSnapshot<QuerySnapshot<Object?>> may = messages.
//  }

  void sendMessage(String message,String userid) async{
    try {
    await FirebaseFirestore.instance.collection('maviazindani')
    .doc(userid)
    .collection('chatList')
    .add({
      'text':message,
      'user':userid,
      'isUserSend': true,
    });

    await FirebaseFirestore.instance.collection('maazzindani')
    .doc(userid)
    .collection('chatList')
    .add({
      'text':message,
      'user':userid,
      'isUserSend': false,
    });
    print('Message sent successfully');
      notifyListeners();
    } catch (e) {
      print('this is error: ${e}');
      notifyListeners();
    }
    notifyListeners();
  }
}