import 'package:CRUD_Cod3r/models/user.dart';
import 'package:CRUD_Cod3r/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      //so vai carregar os dados se o usuario nao for nulo
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments;
    //esta recebendo na variavel user os dados que vieram como argumento
    _loadFormData(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                //usado para fazer validação do campo e dado (validator: )
                final isValid = _form.currentState.validate();

                if (isValid) {
                  //chama ele em cada campo para salvar o dado (onSaved: )
                  _form.currentState.save();
                  Provider.of<Users>(context, listen: false).put(
                    User(
                      id: _formData['id'],
                      name: _formData['name'],
                      email: _formData['email'],
                      avatarUrl: _formData['avatarUrl'],
                    ),
                  );

                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['name'],
                  //faz com que se tenha um valor inicial sendo recebido no _formData,
                  //ele seja usado para preencher o campo
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido';
                    }
                    if (value.trim().length < 3) {
                      return 'Nome muito pequeno. No mínimo 3 letras';
                    }
                    return null; //significa que o campo eh valido ja que passou por tds os ifs
                  },
                  onSaved: (value) => _formData['name'] = value,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onSaved: (value) => _formData['email'] = value,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: InputDecoration(labelText: 'URL do Avatar'),
                  onSaved: (value) => _formData['avatarUrl'] = value,
                )
              ],
            )),
      ),
    );
  }
}
