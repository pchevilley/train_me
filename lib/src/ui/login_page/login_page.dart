import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:train_me/src/ui/shared/push_route.dart';
import 'cta_btn.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/images/login_bg.png",
              width: size.width,
              height: size.height,
              fit: BoxFit.cover
            )
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10
              ),
              child: Container(
                color: Colors.black.withOpacity(0.1),
              )
            )
          ),
          Center( 
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: CallToActionButton(
                      Color(0xffFC4C02),
                      "Login with Strava",
                      FontAwesomeIcons.strava,
                      () => _loginWithStrava(context)
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: CallToActionButton(
                      Color(0xff4172B8),
                      "Login with Facebook",
                      FontAwesomeIcons.facebook,
                      () => { print("facebook tapped") }
                    ),
                  )
                ]
              )
            )
          )
        ],
      )
    );
  }



  _loginWithStrava(BuildContext context) {
    Navigator.pushReplacement(context, 
      PushRoute(
        exitPage: this, 
        enterPage: Scaffold(
          appBar: AppBar(
            title: Text("Train me"),
          ),
          body: Center(
              child: Text('Coucou!')
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => print('coucou'),
              child: const Icon(Icons.favorite),
            ),
        )
      )
    );
  }
}