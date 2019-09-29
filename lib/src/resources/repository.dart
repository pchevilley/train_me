import 'dart:async';

import 'strava_api.dart';
import '../models/user_model.dart';

class Repository {
  final stravaAPIProvider = StravaAPIProvider();

  Future<UserModel> fetchAllMovies() => stravaAPIProvider.login();
}