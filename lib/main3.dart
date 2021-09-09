

import 'package:flutt/profile.dart';
import 'package:flutt/wallpaper.dart';
import 'package:flutter/material.dart';

class main3 extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color:Colors.black,
        child:Column(
          children: [
            SizedBox(
              height:20
            ),
            Container(
                height:300,
                child: Image.asset('assets/sx3.png')),
            SizedBox(
                height:20
            ),
            RaisedButton(
                color:Colors.red,

                onPressed:(){

                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return profile();
                      }));
                 },
                child:Text('ارباحك ',style:TextStyle(color:Colors.white,fontSize:22,fontWeight:FontWeight.w700),)

            ),
            SizedBox(
                height:20
            ),
            RaisedButton(
                color:Colors.red,

                onPressed:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return wallpaper();
                      }));
                },
                child:Text('صور وخلفيات ',style:TextStyle(color:Colors.white,fontSize:16,fontWeight:FontWeight.w700),)

            )
          ],
        )
      )


    );
  }
}
