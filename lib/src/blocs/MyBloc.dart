import 'dart:async';

import 'package:my_bloc_login_pattern/src/blocs/Validators.dart';

class MyBloc extends Object with Validators {

    final _emailBlocController = StreamController<String>();
    final _passwordBlocController = StreamController<String>();

    Function(String) get addEmailToStream {
        return _emailBlocController.sink.add;
    }

    Function(String) get addPasswordToStream {
        return _passwordBlocController.sink.add;
    }

    Stream<String> get getEmail {
        return _emailBlocController.stream.transform(emailValidator);
    }

    Stream<String> get getPassword {
        return _passwordBlocController.stream.transform(passwordValidator);
    }



    void closeControllers() {
        _emailBlocController.close();
        _passwordBlocController.close();
    }


}

final myBloc = MyBloc();