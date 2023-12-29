import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'group.dart';
import 'group_detail.dart';

const List<String> groups = <String>["I-31", "I-41", "I-31с.т.","MI-31"];
const List<String> infoGroups = <String>["18 students", "11 students", "8 students","20 students"];
const List<Group> listGroups=[
  Group("I-31","18 students","g1.png"),
  Group("I-41","11 students","g2.png"),
  Group("I-31с.т.","8 students","g3.png"),
];

void main() {
  return runApp(MaterialApp(
      // home: MainScreen()
      home: GroupsScreen()
  ));
}


class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
         // body:
         //   MyLisColumn( children: [
         //     ElevatedButton(
         //         child: Text("Add Group", style: TextStyle(fontSize: 24)),
         //         onPressed: (){
         //           print("Clicked");
         //         }
         //     ),t1()
         // ]),
         // body:MyList1(),
         body: Center(
             child: Padding(
               padding: EdgeInsets.all(15.0),
               child: Column(

                   children: <Widget>[
                     const Text("EXAMPLE using StatefulWidget"),
                     // Counter(value: 1, increment: 5),
                     // Counter(value: 100, increment: -10),
                     const Text("Список I-31, I-41"),
                     ElevatedButton(
                         child: Text("Ingo Groups", style: TextStyle(fontSize: 24)),
                         onPressed: (){
                           print("Clicked");
                           Navigator.push(context,MaterialPageRoute(builder: (context){
                             return const GroupsScreen();
                           }));
                         }
                     ),
                     GestureDetector(
                         child: Image.network('https://cdn-icons-png.flaticon.com/512/166/166258.png', width:100),
                         onTap: (){
                           print("Clicked");
                           Navigator.push(context,MaterialPageRoute(builder: (context){
                             return const GroupsScreen();
                           }));
                         }
                     )
                     // MyList1()
                     // ListView(
                     //     children:<Widget> [
                     //
                     //         Text('Map'),
                     //
                     //        Text('Album'),
                     //       Text('Phone'),
                     //
                     //     ]
                     // )
                   ]),
             )
         ),
         appBar: AppBar(title: Text("GROUPS")),
       );
  }

}

//
// class MyList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(children: const <Widget>[
//       ListTile(
//         leading: Icon(Icons.map),
//         title: Text('Map'),
//       ),
//       ListTile(
//         leading: Icon(Icons.photo_album),
//         title: Text('Album'),
//       ),
//       ListTile(
//         leading: Icon(Icons.phone),
//         title: Text('Phone'),
//       ),
//     ]);
//   }
// }


class MyList1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: groups.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.map),
            title: Text(groups[index], style: TextStyle(fontSize: 22.0)),
            subtitle:  Text("Info counts of students: ${infoGroups[index]}"),
            onTap: (){
              print(groups[index]);
              // Fluttertoast.showToast(
              //     msg: groups[index],
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.red,
              //     textColor: Colors.white,
              //     fontSize: 16.0
              // );
            },
          );
        });
  }
}


class GroupsScreen extends StatelessWidget{
  const GroupsScreen({Key? key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Groups of Univer")),
      body: ListGroups(listGroups: listGroups)
        
    );
  }

}



class ListGroups extends StatelessWidget {
  final List<Group> listGroups;
  const ListGroups({Key? key, required this.listGroups}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: listGroups.length,
        separatorBuilder: (BuildContext contect, int index)=>Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.map),
            title: Text(listGroups[index].title, style: TextStyle(fontSize: 22.0)),
            // subtitle:  Text("Info counts of students: ${listGroups[index].description}"),
            onTap: (){
              print(listGroups[index].title);
              // Fluttertoast.showToast(
              //     msg: listGroups[index].title,
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     backgroundColor: Colors.red,
              //     textColor: Colors.white,
              //     fontSize: 16.0
              // );
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>GroupDetail(groupSelected:listGroups[index])),
              );
            },
          );
        });
  }
}

//
//
// class MyListCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(padding: EdgeInsets.all(10), children: const <Widget>[
//       Card(
//         child: Text('Map'),
//       ),
//       Card(
//         child: Text('Album'),
//       ),
//       Card(
//         child: Text('Phone'),
//       ),
//     ]);
//   }
// }
//
// class Counter extends StatefulWidget {
//   int value = 0;
//   int increment = 1;
//
//   Counter({Key? key, required this.value, required this.increment})
//       : super(key: key);
//
//   @override
//   _CounterState createState() => _CounterState(this.value, this.increment);
// }
//
// class _CounterState extends State<Counter> {
//   int value = 0;
//   int increment = 1;
//
//   _CounterState(this.value, this.increment);
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       child: Text("Value: $value", style: TextStyle(fontSize: 22)),
//       onPressed: () {
//         setState(() {
//           value = value + increment;
//         });
//       },
//     );
//   }
// }
