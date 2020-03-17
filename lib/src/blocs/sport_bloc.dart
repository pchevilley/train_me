import 'dart:async';
import 'package:train_me/src/models/sport.dart';

import '../resources/repository.dart';

class GoalsBloc {
  final _repository = Repository();

  Stream<List<Sport>> getSports() {
    return _repository.getSports();
  }
}

final bloc = GoalsBloc();