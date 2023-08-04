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
        body: const Text('Página de buscar'),
      ),
    );
  }
}
