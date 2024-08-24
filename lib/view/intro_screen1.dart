import 'package:flutter/material.dart';
import 'package:cheatapp/component.dart';
import 'package:cheatapp/local_assets.dart';
import 'package:cheatapp/view/intro_screen2.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: c_whiteColor,
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.11,
                width: size.width*0.9,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: size.height*0.5,
                    width: size.width*0.8,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(img_backgroundoffood),fit: BoxFit.fill)
                    ),
                    ),
                  Container(
                    height: size.height*0.31,
                    width: size.width*0.65,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage(img_abremovebgpreview),fit: BoxFit.fill)
                    ),
                  ),
                ],
              ),
               SizedBox(
                height: size.height*0.14,
              ),
              const Text(
                'Foodie is Where Your \n Comfort Food Resides',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: c_textBlackColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Enjoy a fast and smooth food delivery at\n your doorstep',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: c_textBlackColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen2()));
                  },
                  child: Container(
                      height: 50,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: c_pinkColor,
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: c_whiteColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
