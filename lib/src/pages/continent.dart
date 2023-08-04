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
                    TextButton(
                      style: flatButtonStyle,
                      onPressed: () {},
                      child: Text(
                          '${appData.data[index]['name']} (${cities.length})'),
                    ),
                    const Text('Ver cidades')
                  ],
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cities.length,
                      itemBuilder: (cityContext, cityIndex) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          child: Text('${cities[cityIndex]['name']}'),
                        );
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
