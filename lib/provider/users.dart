import 'dart:math';

import 'package:CRUD_Cod3r/data/dummy_users.dart';
import 'package:CRUD_Cod3r/models/user.dart';
import 'package:flutter/material.dart';

//a classe usuario vai ser responsavel por fazer toda a função de busca, coleta, alteração de dados do usuario
class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [
      ..._items.values
    ]; //foi usado o operador spread(...) para fazer uma copia de dummy_users
    /*foi feito o clone para encapsular a lista,
    evitando q seja feita alguma alteração indesejada diretamente na original*/
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        !user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      //.trim; retira os espaços em branco, ou seja .trim().isEmpty verifica se ta vazio o campo
      _items.update(
        user.id,
        (_) => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      //adicionar novo contato
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    //editar

    notifyListeners(); //serve para informar o provider de que houve alteração e atualizar a tela
  }
}
