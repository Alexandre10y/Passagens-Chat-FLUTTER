import 'package:flutter/material.dart';
import 'package:provinha_god/screens/login.dart';

import 'chat.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  icon: Icon(Icons.person_outlined),
                  onPressed: () {
                    // Coloque aqui o código a ser executado quando o ícone for pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login())
                    );
                  },
                )),
            ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Color(0xFFF65959),
              ),
              Text(
                "Guarapuava - PR",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
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
                  icon: Icon(Icons.message_outlined),
                  onPressed: () {
                    // Coloque aqui o código a ser executado quando o ícone for pressionado
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Chat(title: 'Chat Geral',
                      children: Icon(Icons.message_outlined),)),
                    );
                  },
                )),
          )
        ],
      ),
    );
  }
}
