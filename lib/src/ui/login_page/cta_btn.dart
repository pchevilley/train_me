import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallToActionButton extends StatelessWidget {
  final Color color;
  final String label;
  final IconData iconData;
  final Function onTap;

  CallToActionButton(this.color, this.label, this.iconData, this.onTap);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          SizedBox(
            width: 40,
            child: Icon(iconData, color: Colors.white,),
          ),
          Expanded(
            child: Center(
              child: Text(
                label, 
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                )
              )
            ),
          )
        ]
      ),
      color: color,
      autofocus: false,
      clipBehavior: Clip.none,
      onPressed: onTap,
    );
  }
}