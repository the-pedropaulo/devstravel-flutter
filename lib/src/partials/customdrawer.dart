import 'package:flutter/material.dart';

Widget CustomDrawer({required BuildContext pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DevsTravel',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue',
                      fontWeight: FontWeight.bold)),
              Text('versão 1.0',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: 'Helvetica Neue'))
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/home');
          },
        ),
        ListTile(
          leading: const Icon(Icons.public),
          title: const Text('Escolher Continente'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/continent');
          },
        ),
        ListTile(
          leading: const Icon(Icons.search),
          title: const Text('Buscar Cidade'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/search');
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Cidades Salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext, '/favorites');
          },
        ),
      ],
    ),
  );
}
