import 'package:CRUD_Cod3r/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      //ListTile e bom para se usar com o listView pois ele ja tem o necessario para ser feito o posicionamento
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
