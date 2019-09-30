import 'dart:async';

import 'package:strava_flutter/Models/detailedAthlete.dart';

import 'strava_api.dart';

class Repository {
  final stravaAPIProvider = StravaAPIProvider();

  Future<bool> loginWithStrava() => stravaAPIProvider.auth();
  Future<DetailedAthlete> getStravaProfile() => stravaAPIProvider.getAthlete();
}