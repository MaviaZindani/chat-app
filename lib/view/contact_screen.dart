import 'package:cheatapp/component.dart';
import 'package:cheatapp/controller/local_logic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    LocalLogic provider = Provider.of(context,listen: true);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height *0.12),
            const Text(
              'Contact\'s',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: c_textBlackColor,
              ),
            ),
            SizedBox(height: size.height *0.04), // Add spacing between header and ListView
            FutureBuilder<QuerySnapshot>(
              future: provider.firebaseFirestore.collection('foodiesids').get(),
              builder: (context,snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator(color: c_pinkColor,));
                }else if(snapshot.connectionState == ConnectionState.none){
                  return Text("There is no data");
                }else{
              return Expanded(
                child: ListView.builder(
                   itemCount: snapshot.data!.docs.length,
                   itemBuilder: (context, index) {
                     var short = snapshot.data!.docs;
                     return Padding(
                       padding: const EdgeInsets.only(
                           left: 22.0, right: 22.0, bottom: 16),
                       child: GestureDetector(
                         onTap: () {},
                         child: ListTile(
                           shape: const RoundedRectangleBorder(
                             side: BorderSide(
                               color: c_textBlackColor,
                               width: 1,
                             ),
                           ),
                           leading: Image.asset(short[index]['img']),
                           title: Text(short[index]['name']),
                           subtitle: Text(short[index]['number']),
                           trailing: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.add_circle,color: c_pinkColor,)),
                         ),
                       ),
                     );
                   },
                 ),
              );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}