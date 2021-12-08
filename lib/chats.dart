import 'package:flutter/material.dart';


class ChatsBody extends StatelessWidget {

  List<Map<String, String>> names = [
    {
      "name": "Nader Mohamed",
      "subTitle": "Mohamed send message",
      "image": "assets/images/person1.png",
      "age": "23",
      "time": "2.30 pm",
    },
    {
      "name": "Ahmed Mohamed",
      "subTitle": "Ali send Fav",
      "image": "assets/images/person2.png",
      "age": "23",
      "time": "9.30 pm",
    },
    {
      "name": "mahmoud Mohamed",
      "subTitle": "Nader send like",
      "image": "assets/images/person3.png",
      "age": "23",
      "time": "1.30 pm",
    },
    {
      "name": "Mohamed Mohamed",
      "subTitle": "Ahmed send ......",
      "image": "assets/images/person1.png",
      "age": "23",
      "time": "2.30 pm",
    },
    {
      "name": "Mohamed Mohamed",
      "subTitle": "Ahmed send ......",
      "image": "assets/images/person3.png",
      "age": "23",
      "time": "3.50 pm",
    },
    {
      "name": "Mohamed Mohamed",
      "subTitle": "Ahmed send ......",
      "image": "assets/images/person2.png",
      "age": "23",
      "time": "5.00 pm",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.fromLTRB(5,10,5,5),
          child: ListTile(
            title: Text("${names[index]["name"]}",style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold
            )),
            subtitle: Text("${names[index]["subTitle"]}",style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold
            )),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black12,
              child: Image.asset(
                "${names[index]["image"]}",
                // width: 45,
                // height: 45,
              ),
            ),
            trailing: Text("${names[index]["time"]}",style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold
            )),
            onTap: (){
              print("Nader mohamed");
            },
          ),
        );
      },
    );
  }
}
