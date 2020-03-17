import 'dart:async';
import 'dart:core';
import 'package:strava_flutter/Models/detailedAthlete.dart';
import 'package:strava_flutter/strava.dart';
import 'package:train_me/src/resources/strava_secret.dart';

class StravaAPIProvider {
  final strava = Strava(true, STRAVA_SECRET);
  final prompt = 'auto';
  bool isAuth = false;

  Future<bool> auth() async {
    isAuth = await strava.oauth(
      STRAVA_CLIENT_ID, 
      'activity:write,activity:read_all,profile:read_all,profile:write', 
      STRAVA_SECRET, 
      prompt
    );

    return isAuth;
  }

  Future<DetailedAthlete> getAthlete() async {
    DetailedAthlete athlete = await strava.getLoggedInAthlete();
    
    if (athlete.fault.statusCode != 200) {
      print(
          'Error in getloggedInAthlete ${athlete.fault.statusCode}  ${athlete.fault.message}');
    } else {
      print('getLoggedInAthlete ${athlete.firstname}  ${athlete.lastname}');
    }

    return athlete;
  }
}
