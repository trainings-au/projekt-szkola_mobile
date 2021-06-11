import 'package:flutter/material.dart';

import 'main.dart';

class PageInfo extends StatelessWidget {
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
                      Icons.arrow_left,
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
                                  'https://lh3.googleusercontent.com/p/AF1QipOWRfLMw4YaogW9v0rOmX7bV38fdLreF-j8M7eZ=w600-k'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 10000,
                              margin: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2),
                              child: Text(
                                "Nulla eget mollis ante. Meacenas pellentesque lorem at odio mollis, vitae mattis risus dictum. Suspendisse fringilla quam a suscipit auctor. Morbi vel dui ac lectus congue dapibus eget interdum arcu. Nunc purus odio, iaculis nec pellentesque ac, tristique nec lorem.\n ",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
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
                            "International School of Poznan\n ",
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
                            Text('Edmunda Taczanowskiego 18, 60-147 Poznań',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey)),
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
                            Text('+48 61 646 37 60',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.blueGrey)),
                          ],
                        ),
                      ])),
            ],
          ))),
    );
  }
}

class imageload extends StatelessWidget {
  final double txt;
  final double txt1;
  final double txt2;
  final String image;

  const imageload(
    this.txt,
    this.txt1,
    this.txt2,
    this.image, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> box = [];
    return ClipRRect(
      borderRadius: BorderRadius.circular(txt),
      child: Image.network(
        (image),
        width: txt1,
        height: txt2,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    );
  }
}
