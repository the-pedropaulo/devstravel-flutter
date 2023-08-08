import 'package:devstravel/src/partials/citybox.dart';
import 'package:devstravel/src/partials/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:devstravel/src/partials/customdrawer.dart';

import '../models/appdata.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPage createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  var list = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appData, child) => Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
            scaffoldKey: _scaffoldKey,
            pageContext: context,
            title: 'Busque uma cidade',
            hiddenSearch: true),
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(
                  onChanged: (text) {
                    var newList = appData.searchCity(text);
                    setState(() {
                      list = newList;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Digite o nome de uma cidade',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search))),
            ),
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(list.length, (index) {
                return CityBox(
                  onTap: (cityData) {
                    Navigator.pushNamed(context, '/city', arguments: cityData);
                  },
                  data: list[index],
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
}
