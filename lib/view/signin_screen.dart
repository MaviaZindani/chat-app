import 'package:cheatapp/controller/local_logic.dart';
import 'package:cheatapp/utils/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:cheatapp/component.dart';
import 'package:cheatapp/local_assets.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LocalLogic localLogic = LocalLogic();
    Size size = MediaQuery.of(context).size;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController name = TextEditingController();
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: c_whiteColor,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.6,
              width: size.width,
              decoration: BoxDecoration(
                  color: c_pinkColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(160, 40),
                      bottomRight: Radius.elliptical(160, 40))),
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.9,
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(img_WhiteLogo),
                        Text(
                          'Deliver Favourite Food',
                          style: TextStyle(
                              color: c_whiteColor,
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Card(
                      elevation: 2,
                      child: Container(
                        height: size.height * 0.6,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                          color: c_whiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SizedBox(
                          height: size.height * 0.9,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                    color: c_textBlackColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: c_textgreyColor,
                                                  width: 0.5)),
                                          prefixIcon: Icon(Icons.person),
                                          hoverColor: c_hoverBoxgreyColor,
                                          hintText: 'Name'),
                                      controller: name,
                                      style: const TextStyle(
                                          color: c_textBlackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: c_textgreyColor,
                                                  width: 0.5)),
                                          prefixIcon: Icon(Icons.email),
                                          hoverColor: c_hoverBoxgreyColor,
                                          hintText: 'Email'),
                                      controller: email,
                                      style: const TextStyle(
                                          color: c_textBlackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: c_textgreyColor,
                                                  width: 0.5)),
                                          prefixIcon: Icon(Icons.lock),
                                          hoverColor: c_hoverBoxgreyColor,
                                          hintText: 'Password'),
                                      controller: password,
                                      style: TextStyle(
                                          color: c_textBlackColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  localLogic.signinMethod(email.text, password.text,context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Container(
                                      height: 40,
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: c_pinkColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Create Account',
                                          style: TextStyle(
                                              color: c_whiteColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: c_textBlackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.loginScreen);
                          },
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(
                              color: c_pinkColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
