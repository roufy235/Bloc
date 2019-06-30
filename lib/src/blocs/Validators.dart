import 'dart:async';

class Validators {

    final emailValidator = StreamTransformer<String, String>.fromHandlers(
        handleData: (newValue, sink) {
            if (newValue.contains("@")) {
                sink.add(newValue);
            }  else {
                sink.addError("Invalid email address");
            }
        }
    );

    final passwordValidator = StreamTransformer<String, String>.fromHandlers(
        handleData: (newValue, sink) {
            if(newValue.length > 3) {
                sink.add(newValue);
            } else {
                sink.addError("Password must be atleast 4 characters");
            }
        }
    );
}