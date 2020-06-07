import 'package:corona_counter/scripts/data.dart';
import 'package:flutter/material.dart';
class Affectedlist extends StatelessWidget {
  Map datathis;
   List<String> state=[""] ,
      deaths=[""] ,
      recovered=[""],
      confirmed=[""],
      active=[""];

  Affectedlist({this.datathis});
  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: ListView.builder(
      itemCount: 30,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Row(
              children: <Widget>[
               listview(color: Colors.red[300],factor: 3,info:datathis==null?"---":datathis["statewise"][index+1]["state"],),
                listview(color: Colors.orange[300],factor: 5,info:datathis==null?"---":datathis["statewise"][index+1]["confirmed"],),
                listview(color: Colors.yellow[300],factor: 5,info: datathis==null?"---":datathis["statewise"][index+1]["active"],),
                listview(color: Colors.grey[300],factor: 5,info: datathis==null?"---":datathis["statewise"][index+1]["deaths"],),
                
              ],
            ),
          ),
        );
      },
    ));
  }
}

class listview extends StatelessWidget {

  Color color;
  String info;
  double factor;
  listview({this.color,this.info,this.factor});
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = 50;
    return Container(

                  width: width/factor,
                  height: height,
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0,top: 5.0),
                    child: Text(info!=null?info:"---"),
                  ),
                );
  }
}