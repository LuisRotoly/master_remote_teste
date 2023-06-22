import 'package:flutter/material.dart';

class UnderConstructionScreen extends StatelessWidget {
  static const routeName = '/under-construction';
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goBackPage(BuildContext context) {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Em construção"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => goBackPage(context),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          color: const Color.fromRGBO(3, 169, 244, 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/construcao.png"),
                      alignment: Alignment.topCenter),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
