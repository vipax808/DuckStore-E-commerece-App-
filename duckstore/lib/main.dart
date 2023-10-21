import 'package:duckstore/Auth/Auth_Login.dart';
import 'package:duckstore/Auth/Auth_SignUp.dart';
import 'package:duckstore/firebase_options.dart';
import 'package:duckstore/main_screen/Customer_Screen.dart';
import 'package:duckstore/main_screen/Welcome_Screen.dart';
import 'package:duckstore/main_screen/supplier_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WelcomeScreen(),
      initialRoute: 'WelcomeScreen',
      routes: {
        'WelcomeScreen': (context) => WelcomeScreen(),
        'CustomerHomeScreen': (context) => CustomerHomeScreen(),
        'SupplierScreen': (context) => SupplierScreen(),
        'AuthSignUp': (context) => AuthSignUp(),
        'AuthLogin': (context) => AuthLogin(),
      },
    );
  }
}
