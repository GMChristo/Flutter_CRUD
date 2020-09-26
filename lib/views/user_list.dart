import 'package:CRUD_Cod3r/components/user_tile.dart';
import 'package:CRUD_Cod3r/models/user.dart';
import 'package:CRUD_Cod3r/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              
              // users.remove(users.byIndex(0));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users
            .count, //bom para se usar quando se tem um valor grande de itens em uma lista
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        // Text(users.byIndex(i)), esta sendo passado o context e o valor para um campo de texto
      ),
    );
  }
}
