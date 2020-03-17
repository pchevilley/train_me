import 'dart:async';

import 'package:strava_flutter/Models/detailedAthlete.dart';
import 'package:train_me/src/models/sport.dart';

import 'strava_api.dart';

import 'sports_provider.dart';

class Repository {
  final stravaAPIProvider = StravaAPIProvider();

  Future<bool> loginWithStrava() => stravaAPIProvider.auth();
  Future<DetailedAthlete> getStravaProfile() => stravaAPIProvider.getAthlete();

  final sportProvider = SportProvider();
  Stream<List<Sport>> getSports() => sportProvider.getSportsList();
}