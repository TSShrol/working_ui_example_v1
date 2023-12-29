import 'package:flutter/material.dart';
import 'group.dart';

class GroupDetail extends StatelessWidget{
  const GroupDetail({Key? key, required this.groupSelected}):super(key:key);
  final Group groupSelected;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(groupSelected.title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(groupSelected.title, style: TextStyle(fontSize: 36.0)),
          Image(image: AssetImage('assets/images/'+groupSelected.urlImg), width: 100,),
          Text(groupSelected.description, style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic))
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_left, color: Colors.deepOrange),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold)),
      )
    );
  }
  }