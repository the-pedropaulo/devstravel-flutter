import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatelessWidget {
  CityPage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    Object? cityData = ModalRoute.of(context)?.settings.arguments;
    print(cityData);
    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Cidade',
            hiddenSearch: false,
            showBack: false),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Bem vindo(a) ao',
                  style: styles,
                ),
              ),
              const Image(
                  image: AssetImage('lib/assets/devstravel_logo.png'),
                  width: 200),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                  'Seu guia de viagem perfeito!',
                  style: styles,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
