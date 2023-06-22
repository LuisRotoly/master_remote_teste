import 'package:flutter/material.dart';
import 'package:master_teste/home/widgets/drawer_widget.dart';
import 'package:master_teste/home/widgets/main_card_button.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Master Remote"),
        backgroundColor: const Color.fromRGBO(3, 169, 244, 1),
      ),
      drawer: const DrawerWidget(key: Key("drawer")),
      body: SafeArea(
        child: Container(
          color: const Color.fromRGBO(3, 169, 244, 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MainCardButton(
                      label: "Acesso Remoto",
                      icon: Icons.computer,
                      page: "/under-construction"),
                  MainCardButton(
                      label: "Backup",
                      icon: Icons.backup,
                      page: "/under-construction")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MainCardButton(
                      label: "Monitoramento",
                      icon: Icons.hearing,
                      page: "/under-construction"),
                  MainCardButton(
                      label: "Gravação Automática",
                      icon: Icons.play_circle_outline,
                      page: "/under-construction"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MainCardButton(
                      label: "Geolocalização",
                      icon: Icons.location_pin,
                      page: "/under-construction"),
                  MainCardButton(
                      label: "Acesso Supervisionado",
                      icon: Icons.groups,
                      page: "/under-construction"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
