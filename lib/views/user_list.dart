import 'package:CRUD_Cod3r/components/user_tile.dart';
import 'package:CRUD_Cod3r/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users
            .length, //bom para se usar quando se tem um valor grande de itens em uma lista
        itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i)),
        // Text(users.values.elementAt(i).name),
        //esta sendo passado o context e o valor para um campo de texto
      ),
    );
  }
}
