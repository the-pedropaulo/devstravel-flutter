import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/citybox.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../partials/customappbar.dart';

class ListCityPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = const TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  ListCityPage({super.key});

  void handleCityBoxAction(pageContext, cityData) {
    Navigator.pushNamed(pageContext, '/city', arguments: cityData);
  }

  @override
  Widget build(BuildContext context) {
    final continentIndex = ModalRoute.of(context)?.settings.arguments as int;

    return Consumer<AppData>(builder: (ctx, appData, child) {
      var cities = [];

      for (var country in appData.data[continentIndex]['countries']) {
        cities.addAll(country['cities']);
      }

      return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              title:
                  '${appData.data[continentIndex]['name']} (${cities.length})',
              hiddenSearch: false,
              showBack: true),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
              crossAxisCount: 3,
              children: List.generate(cities.length, (index) {
                return CityBox(
                    data: cities[index],
                    onTap: (cityData) {
                      handleCityBoxAction(context, cityData);
                    });
              })));
    });
  }
}
