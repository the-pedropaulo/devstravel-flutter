import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

PreferredSizeWidget CustomAppBar(
    {required GlobalKey<ScaffoldState> scaffoldKey,
    required BuildContext pageContext,
    String title = '',
    bool hiddenSearch = false,
    bool showDrawer = false,
    bool showBack = false}) {
  IconButton drawerButton = IconButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      icon: const Icon(Icons.menu, color: Colors.black, size: 30));

  IconButton backButton = IconButton(
      onPressed: () {
        Navigator.pop(pageContext);
      },
      icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30));

  IconButton leadingButton = drawerButton;

  void searchAction() {
    Navigator.pushNamed(pageContext, '/search');
  }

  if (showBack) {
    leadingButton = backButton;
  }
  return AppBar(
    systemOverlayStyle:
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    title: Text(
      title,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    actions: <Widget>[
      !hiddenSearch
          ? IconButton(
              onPressed: () {
                searchAction();
              },
              icon: const Icon(Icons.search, color: Colors.black, size: 30))
          : Container()
    ],
    leading: leadingButton,
  );
}
