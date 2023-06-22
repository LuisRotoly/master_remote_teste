import 'package:flutter/material.dart';

class MainCardButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final String page;

  const MainCardButton(
      {required this.label, required this.icon, required this.page, super.key});

  @override
  Widget build(BuildContext context) {
    void redirectToPage(BuildContext context) {
      Navigator.of(context).pushNamed(page);
    }

    return GestureDetector(
      onTap: () {
        redirectToPage(context);
      },
      child: Card(
        color: const Color.fromRGBO(3, 169, 244, 1),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
        elevation: 5,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: Colors.white),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
