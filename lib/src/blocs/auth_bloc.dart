import 'package:firebase_auth/firebase_auth.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _repository = Repository();
  final _authFetcher = PublishSubject();
  final _fireAuth = FirebaseAuth.instance;

  Observable get isAuth => _authFetcher.stream;
  //todo isAuthenticating?

  loginWithFirebase() async {
    try {
      AuthResult _result = await _fireAuth.signInAnonymously();
      return _result.user != null;
    } catch (e) {
      return false;
    }
  }

  loginWithStrava() async {
    bool _isAuth = await _repository.loginWithStrava();
    _authFetcher.sink.add(_isAuth);

    return await loginWithFirebase();
  }

  dispose() {
    _authFetcher.close();
  }
}

final bloc = AuthBloc();