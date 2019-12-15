import 'package:flutter/material.dart';
import 'package:we_chart/models/message_model.dart';
import 'package:we_chart/models/user.dart';

class ChartScreen extends StatefulWidget {
  final User sender;

  ChartScreen({this.sender});

  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(widget.sender.imageUrl),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                widget.sender.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    fontFamily: 'SultanNahia'),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              iconSize: 24,
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: ()=> Focus.of(context).unfocus(),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35)),
                    child: ListView.builder(
                        padding: EdgeInsets.only(top: 15),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Message msg = messages[index];
                          final bool isMe = msg.sender.id == currentUser.id;
                          return _buildMessage(msg, isMe);
                        }),
                  ),
                ),
              ),
            ),
            _buildMessageComposer()
          ],
        ));
  }

  _buildMessage(Message msg, bool isMe) {
    final msgBody = Container(
        width: MediaQuery.of(context).size.width * 0.75,
        margin: isMe
            ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
            : EdgeInsets.only(top: 8, bottom: 8),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
            color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))
                : BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              msg.time,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              msg.text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            )
          ],
        ));
    if (isMe) {
      return msgBody;
    }
    return Row(
      children: <Widget>[
        msgBody,
        IconButton(
            onPressed: () {},
            icon: msg.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            color:
                msg.isLiked ? Theme.of(context).primaryColor : Colors.blueGrey)
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 8),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.mood,
              color: Colors.blueGrey,
            ),
            iconSize: 25,
            onPressed: () {},
          ),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              onChanged: (val){
                print(val);
              },
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Send a Message',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey
                ),
                border:InputBorder.none
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 10),
            icon: Icon(
              Icons.send,
              color: Colors.blueGrey,
            ),
            iconSize: 25,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
