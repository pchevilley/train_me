
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:train_me/src/blocs/user_bloc.dart';
import 'package:train_me/src/ui/sports_list/sports_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    bloc.getStravaUser();
    super.initState();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Train me"),
      ),
      body: StreamBuilder(
        stream: bloc.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(backgroundImage: NetworkImage(snapshot.data.profileMedium)),
                  Text(snapshot.data.firstname + ' ' + snapshot.data.lastname),
                  SportsList()
                ],
              )
            );
          } else { 
            return Center(
              child: CircularProgressIndicator()
            );
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('coucou'),
        child: const Icon(FontAwesomeIcons.running),
      ),
    );
  }
}