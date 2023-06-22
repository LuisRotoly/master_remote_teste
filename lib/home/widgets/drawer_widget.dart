import 'package:flutter/material.dart';
import 'package:master_teste/helper/shared_preference.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? userName = "";

  @override
  initState() {
    getUserNameInSharedPreferences();
    super.initState();
  }

  void getUserNameInSharedPreferences() async {
    await SharedPreference.getUserLoggedInSharedPreference().then((user) {
      setState(() {
        userName = user;
      });
    });
  }

  void goToUnderConstruction(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).pushNamed("/under-construction");
  }

  void logout(BuildContext context) {
    SharedPreference.clearUserInSharedPreference();
    Navigator.pushNamedAndRemoveUntil(
        context, "/sign-in", (Route<dynamic> route) => false);
  }

  Widget buildHeader(String name) {
    return DrawerHeader(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .47,
            child: FittedBox(
              child: Text(
                "Olá, $name",
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    return ListTile(
        leading: Icon(icon, color: Colors.white, size: 30),
        title: Text(text,
            style: const TextStyle(fontSize: 18, color: Colors.white)),
        hoverColor: const Color.fromRGBO(3, 169, 244, 1),
        onTap: onClicked);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .80,
      backgroundColor: const Color.fromRGBO(3, 169, 244, 0.8),
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 100,
            child: buildHeader(
              userName!,
            ),
          ),
          const SizedBox(
              height: 8, child: Divider(color: Colors.white, thickness: 1)),
          buildMenuItem(
            text: 'Home',
            icon: Icons.house,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Acesso Remoto',
            icon: Icons.computer,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Backup',
            icon: Icons.backup,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Monitoramento',
            icon: Icons.hearing,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Gravação Automática',
            icon: Icons.play_circle_outline,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Geolocalização',
            icon: Icons.location_pin,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Acesso Supervisionado',
            icon: Icons.groups,
            onClicked: () => goToUnderConstruction(context),
          ),
          const SizedBox(height: 8),
          buildMenuItem(
            text: 'Sair',
            icon: Icons.exit_to_app,
            onClicked: () => logout(context),
          ),
        ],
      ),
    );
  }
}
