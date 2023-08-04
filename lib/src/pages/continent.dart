import 'package:devstravel/src/partials/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/partials/customdrawer.dart';

import '../models/appdata.dart';

class ContinentPage extends StatefulWidget {
  const ContinentPage({super.key});

  @override
  _ContinentPage createState() => _ContinentPage();
}

class _ContinentPage extends State<ContinentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.black,
    padding: const EdgeInsets.all(10),
  );

  void handleSeeCitysAction(continentIndex) {
    print(continentIndex);
  }

  void handleCitysBoxAction(cityData) {
    print(cityData['name']);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Escolha um continente',
            hiddenSearch: false),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: appData.data.length,
          itemBuilder: (context, index) {
            // return Text('Continentes: ${appData.data[index]['name']}');

            var cities = [];

            for (var country in appData.data[index]['countries']) {
              cities.addAll(country['cities']);
            }

            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Text(
                        '${appData.data[index]['name']} (${cities.length})',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica Neue',
                            fontSize: 14),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          handleSeeCitysAction(index);
                        },
                        child: const Text(
                          'Ver cidades',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica Neue',
                              fontSize: 11,
                              color: Colors.grey),
                        ))
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (cityContext, cityIndex) {
                        return CityBox(
                            data: cities[cityIndex],
                            onTap: (cityData) {
                              handleCitysBoxAction(cityData);
                            });
                      }),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
