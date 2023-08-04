import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../models/appdata.dart';

class PreloadPage extends StatefulWidget {
  const PreloadPage({super.key});

  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = false;

  void requestInfo() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      loading = true;
    });

    bool req = await Provider.of<AppData>(context, listen: false).requestData();

    if (req) {
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    requestInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/devstravel_logo.png',
              width: 200,
            ),
            loading
                ? Container(
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      'Carregando informações...',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(),
            loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  )
                : Container(),
            !loading
                ? Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: const Text('Tentar novamente'),
                      onPressed: () {},
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
