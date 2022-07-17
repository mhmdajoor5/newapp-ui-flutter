import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter/models/user/user_model.dart';




class UserScreen extends StatelessWidget {
  List<DateUser> User = [
    DateUser(
      id: 1,
      name: 'fadel',
      phone: '+054557555',
    ),
    DateUser(
      id: 2,
      name: 'Amer',
      phone: '+545644',
    ),
    DateUser(
      id: 3,
      name: 'Layan',
      phone: '+054557555',
    ),
    DateUser(
      id: 4,
      name: 'Mama',
      phone: '+054557555',
    ),
    DateUser(
      id: 5,
      name: 'Baba',
      phone: '+054557555',
    ),
    DateUser(
      id: 6,
      name: 'msak',
      phone: '+054557555',
    ),
    DateUser(
      id: 1,
      name: 'fadel',
      phone: '+054557555',
    ),
    DateUser(
      id: 2,
      name: 'Amer',
      phone: '+545644',
    ),
    DateUser(
      id: 3,
      name: 'Layan',
      phone: '+054557555',
    ),
    DateUser(
      id: 4,
      name: 'Mama',
      phone: '+054557555',
    ),
    DateUser(
      id: 5,
      name: 'Baba',
      phone: '+054557555',
    ),
    DateUser(
      id: 6,
      name: 'msak',
      phone: '+054557555',
    ),
  ];
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            iconSize: 25.5,
            onPressed: (){},
            icon: Icon(
              Icons.search
            )),
        ],
      ),
      body:  ListView.separated(
          itemBuilder: (context, index) => buildUserItem(User[index]) ,
          separatorBuilder: (context, index) => Container(
            height: 1.0,
            width: double.infinity,
            color: Colors.grey,
          ) ,
          itemCount: User.length ),
    );
  }

Widget buildUserItem(DateUser Users) => Padding(
  padding: const EdgeInsets.all(13.0),
  child: Row(
    children: [
      CircleAvatar(
        backgroundColor: Colors.black38,
        radius: 30.0,
        child: Text(
          '${Users.id}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      SizedBox(
        width: 10.0,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${Users.name}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          Text(
            '${Users.phone}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    ],
  ),
);

}
