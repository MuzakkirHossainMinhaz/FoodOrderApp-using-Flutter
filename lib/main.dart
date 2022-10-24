// ignore_for_file: dead_code, unused_label

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_order_app/provider/my_provider.dart';
import 'package:food_order_app/screen/home_page.dart';
import 'package:food_order_app/screen/welcome_page.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

    //options: DefaultFirebaseOptions.android, // if you're using windows emulator
    //options: DefaultFirebaseOptions.ios, // if you're using windows emulator
    //options: DefaultFirebaseOptions.web, // for web
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff2b2b2b),
          appBarTheme: const AppBarTheme(
            color: Color(0xff2b2b2b),
          ),
        ),
        // home: const HomePage(),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (index, snapshot) {
            if (snapshot.hasData) {
              return const HomePage();
            } else {
              return const WelcomePage();
            }
          },
        ),
      ),
    );
  }
}
