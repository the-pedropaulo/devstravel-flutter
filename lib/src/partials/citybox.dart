import 'package:flutter/material.dart';

class CityBox extends StatelessWidget {
  final data;
  final Function onTap;

  const CityBox({super.key, this.data, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          onTap(data);
        },
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: (ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  '${data['places'][0]['img']}',
                  fit: BoxFit.cover,
                ),
              )),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: (Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54])),
              )),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: (Text(
                '${data['name']}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              )),
            )
          ],
        ),
      ),
    );
  }
}
