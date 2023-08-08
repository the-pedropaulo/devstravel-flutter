import 'package:devstravel/src/models/appdata.dart';
import 'package:devstravel/src/partials/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  _CityPage createState() => _CityPage();
}

class _CityPage extends State<CityPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  bool like = false;

  TextStyle styles = const TextStyle(
      fontSize: 19, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void handleBackButtonAction(pageContext) {
    Navigator.pop(pageContext);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? cityData =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double bottomHeight = MediaQuery.of(context).padding.bottom;

    var starRate = double.parse(cityData?['review']).floor();
    List<bool> stars = [];

    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }

    return Consumer<AppData>(builder: (ctx, appData, child) {
      like = appData.hasFavorite(cityData?['name']);

      return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(pageContext: context),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 250,
              child: Image.network(
                cityData?['places'][0]['img'],
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      cityData?['name'],
                                      style: styles,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                          children: stars
                                              .map((e) => Icon(
                                                    Icons.star,
                                                    color: e == true
                                                        ? Colors.blue
                                                        : Colors.grey,
                                                    size: 16,
                                                  ))
                                              .toList()),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          cityData?['review'],
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Helvetica Neue'),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: IconButton(
                                icon: Icon(
                                  like ? Icons.favorite : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  setState(() {
                                    appData.addFavorite(cityData?['name']);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(15),
                          child: Text(
                            cityData?['description'],
                            style: const TextStyle(
                                fontFamily: 'Helvetiva Neue',
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                color: Colors.grey),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: (const Text(
                            'PRINCIPAIS PONTOS TURÍSTICOS',
                            style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(bottom: bottomHeight),
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(cityData?['places'].length,
                              (index) {
                            return Column(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1 / 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        cityData?['places'][index]['img'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    cityData?['places'][index]['name'],
                                    style: const TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: const Text(
                                    'Ponto Turístico',
                                    style: TextStyle(
                                        fontFamily: 'Helvetica Neue',
                                        fontSize: 11,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            );
                          }),
                        )
                      ],
                    ))
              ],
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(top: statusBarHeight),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  handleBackButtonAction(context);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
