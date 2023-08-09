import 'package:devstravel/src/partials/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/partials/customdrawer.dart';

import '../models/appdata.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPage createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var list = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(builder: (ctx, appData, child) {
      List favorites = appData.favoritesList();

      return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              title: 'Suas cidades favoritas',
              hiddenSearch: true),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 2,
            children: List.generate(favorites.length, (index) {
              return CityBox(
                onTap: (cityData) {
                  Navigator.pushNamed(context, '/city', arguments: cityData);
                },
                data: favorites[index],
              );
            }),
          ));
    });
  }
}
