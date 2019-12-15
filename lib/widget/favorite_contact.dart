import 'package:flutter/material.dart';
import 'package:we_chart/models/message_model.dart';
import 'package:we_chart/screens/chart_screen.dart';

class FavoriteContact extends StatelessWidget {
  const FavoriteContact({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal:25,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Favorite Contacts',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[700],
                    letterSpacing: 1.04,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey[700],
                ),
                iconSize: 25,
              )
            ],
          ),
        ),
        Container(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10),
              scrollDirection: Axis.horizontal,
              itemCount: favorite.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ChartScreen(sender: favorite[index])));
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(favorite[index].imageUrl),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          favorite[index].name,
                          style: TextStyle(
                              fontSize: 18,
                              color:Colors.grey,
                              fontFamily: 'SultanNahia'
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
