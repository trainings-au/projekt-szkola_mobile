import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'for_map.dart';
import 'main.dart';
import 'models.dart';

class ContentPage extends StatelessWidget {
  final InstructionModel model;

  const ContentPage({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  model.urlToIcon,
                  width: 60,
                  height: 60,
                ),
              ),
              Text(
                model.title,
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
                    model.description,
                    style: TextStyle(fontSize: 18, fontFamily: "Calibri"),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 16),
                  itemCount: model.models.length,
                  itemBuilder: (context, index) {
                    final contactModel = model.models[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            isThreeLine: true,
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
                                          MapUtils.openMap(contactModel.lat,
                                              contactModel.lon);
                                        },
                                        child: new Text(contactModel.address)),
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
                                        onTap: () => launch(
                                            "tel://" + contactModel.phone),
                                        child: new Text(contactModel.phone)),
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
                                      child: Text(contactModel.www),
                                      onTap: () => launch(contactModel.www),
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
}
