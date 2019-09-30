import 'package:strava_flutter/Models/detailedAthlete.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject();

  Observable get user => _userFetcher.stream;

  getStravaUser() async {
    DetailedAthlete _user = await _repository.getStravaProfile();
    _userFetcher.sink.add(_user);
  }

  dispose() {
    _userFetcher.close();
  }
}

final bloc = UserBloc();