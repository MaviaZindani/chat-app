import 'package:cheatapp/arguments/cheat_screen_arguments.dart';
import 'package:cheatapp/controller/local_logic.dart';
import 'package:cheatapp/view/contact_screen.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cheatapp/utils/navigate_key.dart';
import 'package:cheatapp/utils/routes_name.dart';
import 'package:cheatapp/view/cheat_screen.dart';
import 'package:cheatapp/view/home_screen.dart';
import 'package:cheatapp/view/intro_screen1.dart';
import 'package:cheatapp/view/intro_screen2.dart';
import 'package:cheatapp/view/login_screen.dart';
import 'package:cheatapp/view/signin_screen.dart';
import 'package:cheatapp/view/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,),
      builder: (context, snapshot) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<LocalLogic>(create: (_) => LocalLogic()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              routes: {
                RoutesName.homeScreen: ((context) => const HomeScreen()),
                RoutesName.loginScreen: ((context) => const LoginScreen()),
                RoutesName.introScreen2: ((context) => const IntroScreen2()),
                RoutesName.splashScreen: ((context) => const SplashScreen()),
                RoutesName.signinScreen: ((context) => const SigninScreen()),
                RoutesName.introScreen1: ((context) => const IntroScreen1()),
                RoutesName.contactScreen: ((context) => const ContactScreen()),
              },
              initialRoute: RoutesName.splashScreen,
              navigatorKey: Navigation.navigationkey,
              onGenerateRoute: (settings) {
                if (settings.name == RoutesName.cheatScreen) {
                  var argu = settings.arguments as CheatScreenArguments;
                  return MaterialPageRoute(builder: (context)=> CheatScreen(cheatid: argu.cheatid));
                }
              },
            ),
        );
      }
    ); 
    }
  }


