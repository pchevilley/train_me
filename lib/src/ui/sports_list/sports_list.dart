import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:train_me/src/blocs/sport_bloc.dart';

class SportsList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SportsListState();
  }
}

class SportsListState extends State<SportsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.getSports(),
      builder: (context, snapshot) {
        return  Expanded(
          child: ListView.builder(
            itemCount: snapshot.data != null ? snapshot.data.length : 0,
            itemBuilder: (context, index) {
              return Text(snapshot.data[index].name);
            },
          )
        );
      }
    );
  }
}