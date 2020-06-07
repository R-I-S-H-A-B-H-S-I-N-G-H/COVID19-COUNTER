import 'dart:convert' show json;
import 'package:corona_counter/scripts/totalcases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'mostaffectedstates.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://api.covid19india.org/data.json";
  int c = 0;
  Map data;
  List<String> state = [""],
      active = [""],
      deaths = [""],
      confirmed = [""],
      recovered = [""];
  fetchCoronaData(int count) async {
    http.Response response = await http.get(url);
    data = json.decode(response.body);
    if (data == null && count < 10) {
      print("REtrying......" + count.toString());
      return fetchCoronaData(count += 1);
    }
    setState(() {
      print(data["statewise"]);
      data = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchCoronaData(c);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 50;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('COVID19-COUNTER'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Total Cases",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            TotalCases(
              data: data,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10),
              child: Text(
                "Most Affected States",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: height,
                    width: width/3,
                    child: Padding(
                      padding: EdgeInsets.only(top:13,left:8),
                      child: Text("State",style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    color: Colors.red[300],

                  ),
                   Container(
                     height: height,
                    width: width/5,
                    child: Padding(
                      padding: EdgeInsets.only(top:13,left:8),
                      child: Text("Confirmed",style: TextStyle(fontWeight: FontWeight.bold),)),
                     color: Colors.orange[300],
                  ),
                   Container(
                     height: height,
                    width: width/5,
                    child: Padding(
                      padding: EdgeInsets.only(top:13,left:8),
                      child: Text("Active",style: TextStyle(fontWeight: FontWeight.bold),)),
                     color: Colors.yellow[300],
                  ),
                   Container(
                     height: height,
                    width: width/5,
                    child: Padding(
                      padding: EdgeInsets.only(top:13,left:8),
                      child: Text("Deaths",style: TextStyle(fontWeight: FontWeight.bold),)),
                     color: Colors.grey[300],
                  )
                ],
              ),
            ),
            Affectedlist(
              datathis: data,
            ),
          ],
        ),
      ),
    );
  }
}
