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

  //adicionar novo contato
  void put(User user) {
    debugPrint(user.id);
    if (user == null) {
      return;
    }

    if ((user.id != null &&
        !user.id.trim().isNotEmpty) || //alterado para corrigir erro de verificação
        _items.containsKey(user.id)) {
          debugPrint('entrou no contains');
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
      final id = (_items.length+1).toString();
      // final id = Random().nextDouble().toString(); alterado para linha de cima pois estava gerando valor aleatorio
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
    notifyListeners(); //serve para informar o provider de que houve alteração e atualizar a tela
  }

  //remover contato de acordo com o id passado
  void remove(User user) {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
