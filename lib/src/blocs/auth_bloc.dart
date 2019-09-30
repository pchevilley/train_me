import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final _repository = Repository();
  final _authFetcher = PublishSubject();

  Observable get isAuth => _authFetcher.stream;
  //todo isAuthenticating?

  loginWithStrava() async {
    bool _isAuth = await _repository.loginWithStrava();
    _authFetcher.sink.add(_isAuth);

    return _isAuth;
  }

  dispose() {
    _authFetcher.close();
  }
}

final bloc = AuthBloc();