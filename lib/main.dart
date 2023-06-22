import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_teste/helper/shared_preference.dart';
import 'package:master_teste/signIn/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'construction/under_construction_screen.dart';
import 'home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? userNameLoggedIn;
  bool isLoading = true;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }

  void getLoggedInState() async {
    await SharedPreference.getUserLoggedInSharedPreference().then((userName) {
      setState(() {
        userNameLoggedIn = userName;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Master Remote Luis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/home-screen": (ctx) => const HomeScreen(),
        "/sign-in": (ctx) => const SignIn(),
        "/under-construction": (ctx) => const UnderConstructionScreen(),
      },
      home: isLoading
          ? SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : (userNameLoggedIn != null)
              ? const HomeScreen()
              : const SignIn(),
    );
  }
}
