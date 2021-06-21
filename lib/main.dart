import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projekt_szkola/list_element.dart';

import 'info_page.dart';
import 'models.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  final List<InstructionModel> poprzyjezdzie;
  final List<InstructionModel> pobyt;

  const MainPage({Key key, this.poprzyjezdzie, this.pobyt}) : super(key: key);

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
                builder: (context) => InfoPage(),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}

class _PageOneState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  Future<List<InstructionModel>> instructions;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    instructions = fetchInstructions();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Future<List<InstructionModel>> fetchInstructions() async {
    final result = await http.get(
        Uri.parse('https://project-school-2021.herokuapp.com/instructions'));

    final list = jsonDecode(result.body)
        .map<InstructionModel>((e) => InstructionModel.fromJson(e))
        .toList();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        body: FutureBuilder<List<InstructionModel>>(
          future: instructions,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        instructions = fetchInstructions();
                      });
                    },
                    child: Text("Problem z siecią, spróbuj ponownie.")),
              );
            } else if (snapshot.hasData) {
              return TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    color: Color.fromARGB(7, 5, 5, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 20,
                          child: Container(
                            color: Color.fromARGB(4, 5, 6, 1),
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Co zrobić ",
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "RobotoMono",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "po przyjeździe",
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "RobotoMono",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                ...snapshot.data
                                    .where((element) =>
                                        element.type == "after_arrival")
                                    .map<Widget>((e) => ListElement(e))
                                    .toList(),
                              ],
                            ),
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
                        Expanded(
                          flex: 8,
                          child: Container(
                            color: Color.fromARGB(4, 5, 6, 1),
                            child: ListView(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Pobyt w Polsce",
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: "RobotoMono",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                ...snapshot.data
                                    .where((element) =>
                                        element.type == "stay_in_poland")
                                    .map<Widget>((e) => ListElement(e))
                                    .toList(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            return Container(
              color: Color.fromARGB(7, 5, 5, 1),
              child: Center(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black26,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Color.fromARGB(140, 1, 1, 1)),
                    strokeWidth: 8,
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          labelColor: Color.fromARGB(140, 1, 1, 1),
          unselectedLabelColor: Color.fromARGB(140, 1, 1, 1),
          indicatorColor: Color.fromARGB(140, 1, 1, 1),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 4.0),
            insets: EdgeInsets.fromLTRB(0, 0, 0, 52.0),
          ),
          indicatorWeight: 9,
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
