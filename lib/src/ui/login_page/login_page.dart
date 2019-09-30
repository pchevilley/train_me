import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:train_me/src/blocs/auth_bloc.dart';
import 'package:train_me/src/ui/home_page/home_page.dart';
import 'package:train_me/src/ui/shared/push_route.dart';
import 'cta_btn.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends  State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: StreamBuilder(
        stream: bloc.isAuth,
        builder: (context, snapshot) {
          if(snapshot.hasData && snapshot.data) {
            return Text("success");
          } else {
            return Stack(
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
                    child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.running, color: Colors.white, size: 180),
                             Padding(padding: EdgeInsets.all(15),),
                              Text("Train Me", style: TextStyle(color: Colors.white, fontSize: 50))
                            ],
                          ),
                        ),
                        Column(
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
                        ),
                      ],
                    )
                  )
                )
              ],
            );
          }
        }
      )
    );
  }

  _loginWithStrava(context) async {
    if(await bloc.loginWithStrava()) {
      _goHome(context);
    }
  }

  _goHome(BuildContext context) {
    Navigator.pushReplacement(context, 
      PushRoute(
        exitPage: context.widget, 
        enterPage: HomePage()
      )
    );
  }
}