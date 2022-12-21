// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:dashboard/pages/account/login.dart';
import 'package:dashboard/pages/home/home.dart';
import 'package:dashboard/pages/provider/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  G_user_id_value = prefs.getString(G_user_id);
  runApp(
    Splash(),
  );
}

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<LoadingControl>(
              create: (context) => LoadingControl())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(
            seconds: 5,
            navigateAfterSeconds:
                G_user_id_value == "" ? new Login() : new Home(),
            title: new Text(
              'Hoş Geldiniz :)',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
            backgroundColor: primeryColor,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100,
            loaderColor: Colors.white,
          ),
        ));
  }
}
