import 'package:flutter/material.dart';
import 'package:my_bloc_login_pattern/src/blocs/MyBloc.dart';

class MyLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text("My Login Bloc"),
        ),
        body: Container(
            margin: EdgeInsets.all(20.0),
            child: Column(
                children: <Widget>[
                    emailField(),
                    Container(margin: EdgeInsets.only(top: 20.0),),
                    passwordField(),
                    Container(margin: EdgeInsets.only(top: 20.0),),
                    loginBtn()
                ],
            ),
        ),
    );
  }

  Widget emailField() {
      return StreamBuilder(
          stream: myBloc.getEmail,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
              return TextField(
                  onChanged: (newValue) {
                      myBloc.addEmailToStream(newValue);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                        errorText: snapshot.error,
                        border: OutlineInputBorder(),
                        labelText: "Email Address"
                  ),
              );
          },
      );
  }

  Widget passwordField() {
      return StreamBuilder(
          stream: myBloc.getPassword,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
              return TextField(
                  onChanged: (newValue) {
                      myBloc.addPasswordToStream(newValue);
                  },
                  decoration: InputDecoration(
                      errorText: snapshot.error,
                        labelText: "Password",
                        border: OutlineInputBorder()
                  ),
                  obscureText: true,
              );
          },

      );
  }

  Widget loginBtn() {
      return RaisedButton(
          onPressed: () {

          },
          child: Text("Login"),
          color: Colors.blue,
          textColor: Colors.white,
      );
  }

}