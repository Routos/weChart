import 'package:flutter/material.dart';
import 'package:we_chart/models/message_model.dart';
import 'package:we_chart/screens/chart_screen.dart';

class RecentCharts extends StatefulWidget {
  @override
  _RecentChartsState createState() => _RecentChartsState();
}

class _RecentChartsState extends State<RecentCharts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chart = chats[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChartScreen(sender: chart.sender)));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 5, bottom: 5, right: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        color: chart.unread ? Color(0xFFFFEFEE) :Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(10)
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(chart.sender.imageUrl),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  chart.sender.name,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    chart.text,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(chart.time,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.grey,),),
                            SizedBox(
                              height: 10,
                            ),
                            chart.unread ?
                            Container(
                              width: 50,height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(35)
                                ),
                                alignment: Alignment.center,
                                child: Text('NEW',style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.bold),)): Text('')
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
