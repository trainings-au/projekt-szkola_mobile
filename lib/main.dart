import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: PageOne(),
    ),
  );
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: Icon(
            Icons.info_outline,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageInfo(),
              ),
            );
          },
        ),
        SizedBox(width: 240),
        TextButton(
          child: Row(
            children: [
              Text("Polski"),
              Icon(
                CupertinoIcons.lab_flask,
                color: Colors.indigo,
              ),
            ],
          ),
          onPressed: null,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Color.fromARGB(7, 5, 5, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Text(
                      "Co zrobić ",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: "RobotoMono",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "po przyjeździe",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: "RobotoMono",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(4, 5, 6, 1),
                    height: 600,
                    child: ListView(
                      children: [
                        greybutton(Icons.badge, "Załatwić Kartę pobytu"),
                        greybutton(Icons.hotel, "Szukać Hoteli"),
                        greybutton(Icons.house, "Szukać Mieszkania"),
                        greybutton(Icons.translate, "Tłumacz POL-RUS"),
                        greybutton(Icons.room, "Podstawowe adresy w Poznaniu"),
                        greybutton(Icons.fiber_pin, "Załatwić pesel"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color.fromARGB(7, 5, 5, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Text(
                      "Pobyt w Polsce",
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: "RobotoMono",
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: 600,
                    color: Color.fromARGB(4, 5, 6, 1),
                    child: ListView(
                      children: [
                        greybutton(Icons.directions_bus,
                            "Rozkład jazdy autobusu i pociągu"),
                        greybutton(
                            Icons.account_balance, "Założyć konto bankowe"),
                        greybutton(Icons.work, "Szukać Pracy"),
                        greybutton(Icons.security, "Policja i Dzielnicowy"),
                        greybutton(Icons.mail, "Adresy Poczty"),
                        greybutton(Icons.engineering, "Służby Komunalne"),
                        greybutton(Icons.restaurant_menu,
                            "Jedzenie, Rozrywka, Kultura"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          labelColor: Color.fromARGB(140, 1, 1, 1),
          unselectedLabelColor: Color.fromARGB(140, 1, 1, 1),
          indicatorColor: Color.fromARGB(140, 1, 1, 1),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 6.0),
            insets: EdgeInsets.fromLTRB(0, 0.0, 0, 40.0),
          ),
          tabs: <Widget>[
            Tab(
              text: "PO PRZYJEŹDZIE",
            ),
            Tab(
              text: "POBYT W POLSCE",
            ),
          ],
        ),
      ),
    );
  }
}

class greybutton extends StatelessWidget {
  final IconData icon;
  final String text;

  const greybutton(
    this.icon,
    this.text, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: EdgeInsets.all(8),
        child: FlatButton(
          child: Row(
            children: [
              Container(
                child: Icon(
                  icon,
                  color: Color.fromARGB(140, 1, 1, 1),
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(4, 8))
                ]),
              ),
              Expanded(
                child: Text(
                  (text),
                  style: TextStyle(
                    color: Color.fromARGB(140, 1, 1, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(4, 8))
            ]),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageIn(),
          ),
        );
      },
    );
  }
}

class PageInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
              child: Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Row(
                  children: [
                    TextButton(
                      child: Icon(
                        CupertinoIcons.arrow_left,
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
                    child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          imageload(30, 5000, 400,
                              'https://lh3.googleusercontent.com/p/AF1QipOWRfLMw4YaogW9v0rOmX7bV38fdLreF-j8M7eZ=w600-k')
                        ],
                      ),
                    ),
                    Container(
                      width: 10000,
                      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                      child: Text(
                        "Nulla eget mollis ante. Meacenas pellentesque lorem at odio mollis, vitae mattis risus dictum. Suspendisse fringilla quam a suscipit auctor. Morbi vel dui ac lectus congue dapibus eget interdum arcu. Nunc purus odio, iaculis nec pellentesque ac, tristique nec lorem.\n ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Calibri"),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )),
                Container(
                  width: 10000,
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  child: Text(
                    "International School of Poznan\n ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: "Calibri"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.location_on, size: 18),
                    Text('Edmunda Taczanowskiego 18, 60-147 Poznań',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.phone, size: 18),
                    Text('+48 61 646 37 60',
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ],
                ),
              ])))),
    );
  }
}

class PageIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
            child: Icon(
              CupertinoIcons.arrow_left,
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
          Text("Brakuje tu kontentu "),
        ],
      ),
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
