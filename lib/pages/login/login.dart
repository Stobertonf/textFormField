import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:apontamento/pages/old/esqueci_senha.dart';

class Login extends StatelessWidget {
  final _tedLogin = TextEditingController();
  final _tedSenha = TextEditingController();

  bool status = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: EdgeInsets.all(30.0),
        padding: EdgeInsets.all(25.0),
        child: _body(context),
      ),
    );
  }

  String _validaLogin(String text) {
    if (text.isEmpty) {
      return "Usuário ou Senha Inválidos, por favor verifique!!!";
    }
    return null;
  }

  String _validaSenha(String text) {
    if (text.isEmpty) {
      return "Usuário ou Senha Inválidos, por favor verifique!!!";
    }
    return null;
  }

  _body(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            //SizedBox(height: 40),
            logo(context),
            SizedBox(height: 40),
            textFormFieldEmail(),
            SizedBox(height: 10),
            textFormFieldSenha(),
            containerButton(context),
            SizedBox(height: 20),
          ],
        ));
  }

  Container containerButton(BuildContext context) {
    return Container(
      height: 50.0,
      width: 20,
      margin: EdgeInsets.only(top: 20.0),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.blueAccent,
        ),
        child: Text(
          "Acessar",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        onPressed: () {
          _clickLogin(context);
        },
      ),
    );
  }

  Container logo(BuildContext context) {
    return Container(
      height: 150.0,
      margin: EdgeInsets.only(top: 10.0),
      child: Image.asset(
        "assets/images/logo.png",
        height: 0,
        width: 100,
        //width: 120,
        //color: Colors.white,
      ),
    );
  }

  Container textFormFieldEmail() {
    return Container(
      child: Form(
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              //   controller: name,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.black),
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Usuário ou Senha Inválidos, por favor verifique!!!";
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Container textFormFieldSenha() {
    return Container(
      child: Form(
        autovalidate: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              //   controller: name,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black),
                  errorStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              validator: (value) {
                if (value == null || value == '') {
                  return "Usuário ou Senha Inválidos, por favor verifique!!!";
                }
              },
            )
          ],
        ),
      ),
    );
  }

  _clickLogin(BuildContext context) {
    final email = _tedLogin.text;
    final senha = _tedSenha.text;

    print("Email: $email , Senha: $senha ");

    if (!_formKey.currentState.validate()) {
      return;
    }

    if (email.isEmpty || senha.isEmpty) {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return Theme(
            data: ThemeData(
                dialogBackgroundColor: Colors.black,
                dialogTheme: DialogTheme(backgroundColor: Colors.black)),
            child: CupertinoAlertDialog(
              title: Text("Erro"),
              content: Text("Sua Mensagem de Erro!!!!"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
