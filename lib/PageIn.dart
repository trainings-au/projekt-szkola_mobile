import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'forMap.dart';
import 'main.dart';

void main() {
  runApp(PageIn(
    items: List<String>.generate(10000, (i) => 'Item $i'),
  ));
}

class PageIn extends StatelessWidget {
  final List<String> items;

  PageIn({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List<String>.generate(3, (i) => "Item $i");
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Color.fromARGB(7, 5, 5, 1),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageOne(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Icon(
                Icons.email,
                size: 60,
                color: Colors.grey,
              ),
              Text(
                "Adresy Poczty",
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: "RobotoMono",
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Container(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    "Nulla eget mollis ante. Meacenas pellentesque lorem at odio mollis, vitae mattis risus dictum. Suspendisse fringilla quam a suscipit auctor. Morbi vel dui ac lectus congue dapibus eget interdum arcu. Nunc purus odio, iaculis nec pellentesque ac, tristique nec lorem.",
                    style: TextStyle(fontSize: 18, fontFamily: "Calibri"),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            isThreeLine: true,
                            // subtitle: Text('Title2'),
                            subtitle: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      color: Color.fromARGB(140, 1, 1, 1),
                                    ),
                                    SizedBox(width: 8),
                                    InkWell(
                                        onTap: () {
                                          MapUtils.openMap(
                                              52.2324353, 17.2524207);
                                        },
                                        child: new Text("Janowicka 8")),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Color.fromARGB(140, 1, 1, 1),
                                    ),
                                    SizedBox(width: 8),
                                    InkWell(
                                        onTap: () =>
                                            launch("tel://+48 61 886 56 07"),
                                        child: new Text("+48 61 886 56 07")),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.link,
                                      color: Color.fromARGB(140, 1, 1, 1),
                                    ),
                                    SizedBox(width: 8),
                                    InkWell(
                                      child: Text('placowki_poczta-polska.pl'),
                                      onTap: () => launch(
                                          'https://www.poczta-polska.pl'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('items', items));
  }
}
