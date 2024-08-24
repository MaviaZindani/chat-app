import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cheatapp/component.dart';
import 'package:cheatapp/controller/local_logic.dart';

class CheatScreen extends StatelessWidget {
  final String cheatid;
  const CheatScreen({super.key, required this.cheatid});
  @override
  Widget build(BuildContext context) {
    TextEditingController message = TextEditingController();
    Size size = MediaQuery.of(context).size;
    LocalLogic provider = Provider.of(context, listen: true);
    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: size.height * 0.1),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Cheat\'s',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: c_textBlackColor,
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.1),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 27.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: FutureBuilder(
                future: provider.firebaseFirestore.collection('maviazindani').doc(cheatid).collection('chatList').get(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          Expanded(
                                  child:  ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (context, index) {
                                        var short = snapshot.data!.docs;
                                        return short[index]['isUserSend'] == true
                                            ? Builder(builder: (context) {
                                                return Padding(
                                                  padding: const EdgeInsets.all(6.0),
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Card(
                                                      elevation: 2,
                                                      child: Container(
                                                        constraints: BoxConstraints(
                                                          minWidth: size.width * 0.1,
                                                          maxWidth: size.width * 0.5,
                                                          minHeight: size.height * 0.04,
                                                          maxHeight: size.height * 0.9,
                                                        ),
                                                        decoration: BoxDecoration(
                                                          color: c_textBoxgreyColor,
                                                          borderRadius:
                                                              BorderRadius.circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 15.0,
                                                              vertical: 10.0),
                                                          child: Text(short[index]['text']),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              })
                                            : Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Card(
                                                    elevation: 2,
                                                    child: Container(
                                                      constraints: BoxConstraints(
                                                        minWidth: size.width * 0.1,
                                                        maxWidth: size.width * 0.5,
                                                        minHeight: size.height * 0.07,
                                                        maxHeight: size.height * 0.9,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: c_whiteColor,
                                                        borderRadius:
                                                            BorderRadius.circular(12),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                                horizontal: 15.0,
                                                                vertical: 10.0),
                                                        child: Text(short[index]['text']),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                      }),
                          ),
                      TextField(
                        controller: message,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            )),
                            suffixIcon: IconButton(
                              onPressed: () {
                                provider.sendMessage(message.text, cheatid);
                              },
                              icon: const Icon(
                                Icons.send,
                                color: c_pinkColor,
                              ),
                            ),
                            hintText: 'Send message',
                            hintStyle: const TextStyle(
                              color: c_textgreyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            )),
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.08),
      ],
    ));
  }
}
