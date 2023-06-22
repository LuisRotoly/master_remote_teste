import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_teste/helper/shared_preference.dart';
import 'package:master_teste/home/home_screen.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/sign-in';
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final userName = TextEditingController();
  final password = TextEditingController();
  bool emptyCredentials = false;
  bool wrongCredentials = false;
  bool isLoading = false;

  bool isEmptyValues() {
    if (userName.text != "" && password.text != "") {
      return false;
    }
    return true;
  }

  void gotoHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return const HomeScreen();
        },
      ),
    );
  }

  Future<bool> verifyCredentials() async {
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection("user")
        .where("userName", isEqualTo: userName.text)
        .where("password", isEqualTo: password.text)
        .get();
    if (response.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void doLogin(BuildContext context) async {
    setState(() {
      wrongCredentials = false;
      emptyCredentials = false;
      isLoading = true;
    });
    if (!isEmptyValues()) {
      if (await verifyCredentials()) {
        await SharedPreference.saveUserInfoToSharedPrefs(userName.text)
            .then((_) => gotoHomePage(context));
      } else {
        setState(() {
          wrongCredentials = true;
          isLoading = false;
        });
      }
    } else {
      setState(() {
        emptyCredentials = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(3, 169, 244, 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/master_logo.webp"),
                      alignment: Alignment.topCenter),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        controller: userName,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: "Usuário",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        obscureText: true,
                        controller: password,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: "Senha",
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isLoading
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(3, 169, 244, 1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                              child: const Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () => doLogin(context),
                            ),
                          ),
                  ],
                ),
                emptyCredentials
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          "Insira um usuário e senha válidos para continuar!",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
                wrongCredentials
                    ? const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Text(
                          "Seu usuário ou senha está incorreto, tente novamente!",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
