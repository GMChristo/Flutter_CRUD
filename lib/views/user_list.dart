import 'package:CRUD_Cod3r/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS}; //foi usado o poerador spread(...) para fazer uma copia de dummy_users
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter CRUD'),
      ),
      body: ListView.builder(
        itemCount: users.length, //bom para se usar quando se tem um valor grande de itens em uma lista
        itemBuilder: (ctx, i) => Text(users.values.elementAt(i).name),
        //esta sendo passado o context e o valor para um campo de texto
      ),
    );
  }
}
