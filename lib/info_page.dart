import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'for_map.dart';
import 'main.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    child: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.network(
                                  'https://powiatsredzki.pl/powiatsredzki/zasoby/images/archiwum/zapraszamy-na-xxi-sesje-rady-powiatu-sredzkiego/zsz.jpg'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 10000,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: Text(
                                "Programiści pierwszego roku z Hipolita w Środzie Wielkopolskiej. Zgrani gorzej jak pies z kotem a współpracy jescze gorsi. A jednak udało im się. Aplikacja ta oparta o wiele trudów, łez i załąmań nerwowych wreszczie powstała. Jeśli chodzi o uczniów albo członków tego projektu to ich imiona nie są niczym tajnym więc: Mateusz, Jakub, Kacper, Adrian, drugi Jakub, Oskar, Dariusz, Bartek i Mikołaj. To właśnie dzięki nim możesz teraz wspomóc się informacjami w ... tej aplikacji ? Uhonorujmy ich poświęcenie chwilą ciszy ... o i miłego korzystania ;3\n ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: "Calibri"),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        )),
                        Container(
                          width: 10000,
                          margin:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: Text(
                            "Centrum Kształcenia Zawodowego i Ustawicznego w Środzie Wlkp.\n ",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontSize: 22,
                                fontFamily: "Calibri"),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on,
                                size: 20, color: Colors.blueGrey),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  MapUtils.openMap(52.230859, 17.2591753);
                                },
                                child: new Text(
                                    'Ignacego Jana Paderewskiego 27, Środa Wielkopolska',
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.blueGrey))),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.phone, size: 20, color: Colors.blueGrey),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => launch("+48 61 285 38 64"),
                                child: new Text('+48 61 285 38 64',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blueGrey))),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.link,
                              color: Color.fromARGB(140, 1, 1, 1),
                            ),
                            SizedBox(width: 8),
                            InkWell(
                              child: Text("www.ckziusroda.edu.pl",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blueGrey)),
                              onTap: () => launch("https://ckziusroda.edu.pl"),
                            ),
                          ],
                        ),
                      ])),
            ],
          ))),
    );
  }
}
