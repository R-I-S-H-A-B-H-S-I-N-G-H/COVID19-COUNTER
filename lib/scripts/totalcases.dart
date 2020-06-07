import 'package:flutter/material.dart';

class TotalCases extends StatelessWidget {
  String state = "10",
      deaths = "20",
      recovered = "20",
      confirmed = "20",
      active = "20";
  Map data;
  TotalCases(
      {this.data, this.deaths, this.recovered, this.active, this.confirmed}) {
    if (data == null) {
    } else {
      this.deaths = this.data["statewise"][0]["deaths"];

      this.recovered = this.data["statewise"][0]["recovered"];
      this.confirmed = this.data["statewise"][0]["confirmed"];
      this.active = this.data["statewise"][0]["active"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        children: <Widget>[
          totalstatus(
            info: "Confirmed",
            color: Colors.red[400],
            textcolor: Colors.red[900],
            cases: confirmed == null ? "--" : confirmed.toString(),
          ),
          totalstatus(
            info: "Active",
            color: Colors.yellow[400],
            textcolor: Colors.yellow[900],
            cases: active == null ? "--" : active.toString(),
          ),
          totalstatus(
            info: "Recovered",
            color: Colors.green[400],
            textcolor: Colors.green[900],
            cases: recovered == null ? "--" : recovered.toString(),
          ),
          totalstatus(
            info: "Deaths",
            color: Colors.grey[400],
            textcolor: Colors.grey[900],
            cases: deaths == null ? "--" : deaths.toString(),
          ),
        ],
      ),
    );
  }
}

class totalstatus extends StatelessWidget {
  var height = 20.0;
  Color color, textcolor;
  String info;
  String cases;
  totalstatus({this.color, this.info, this.cases, this.textcolor});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
      ),
      height: height,
      width: width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            info,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: textcolor, fontSize: 20),
          ),
          Text(cases,style: TextStyle(fontSize: 15),),
        ],
      ),
    );
  }
}
