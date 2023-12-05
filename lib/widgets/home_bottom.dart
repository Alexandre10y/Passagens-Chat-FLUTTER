import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      index: 0,
      items: [
        Icon(
          Icons.home,
          size: 30, 
          color: Colors.redAccent,
        ),
        Icon(Icons.favorite_outline, size: 30,),
        
        Icon(Icons.location_on_outlined, size: 30,),
        Icon(Icons.list, size: 30,),
      ],
    );
  }
}
