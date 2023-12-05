import 'package:flutter/material.dart';
import 'package:provinha_god/screens/home.dart';

class LoginBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
