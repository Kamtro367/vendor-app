import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventorapp/cart_provider.dart';
import 'package:ventorapp/home_page.dart';
import 'package:ventorapp/login_page.dart';
import 'package:ventorapp/reg_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox("ventorBox");
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(),child: MyApp(isLoggedIn: isLoggedIn),)
    );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventor App',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn? HomePage(): LoginPage(),
    );
  }
}
