import 'package:CRUD_Cod3r/data/dummy_users.dart';
import 'package:CRUD_Cod3r/models/user.dart';
import 'package:flutter/material.dart';

//a classe usuario vai ser responsavel por fazer toda a função de busca, coleta, alteração de dados do usuario
class Users with ChangeNotifier {
  final Map <String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values]; //foi usado o operador spread(...) para fazer uma copia de dummy_users
    /*foi feito o clone para encapsular a lista,
    evitando q seja feita alguma alteração indesejada diretamente na original*/
  }

  int get count {
    return _items.length;
  }
}

