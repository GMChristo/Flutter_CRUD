import 'package:CRUD_Cod3r/provider/users.dart';
import 'package:CRUD_Cod3r/routes/app_routes.dart';
import 'package:CRUD_Cod3r/views/user_form.dart';
import 'package:CRUD_Cod3r/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Users(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: UserList(),
        routes: {//no lugar de definir o home por aqui esta sendo usado o app_routes para controlar as paginas
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
        },
      ),
    );
  }
}
