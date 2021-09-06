

import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'd1.dart';
import 'd2.dart';
import 'd3.dart';
import 'd4.dart';
import 'd5.dart';

class decks1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Yami Yugi",
      "Kaiba",
      "Marik",
      "Joey",
      "Bakura",
    
    ];

    final List<Widget> images = [
      Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.red,
        child:Image.asset('assets/yy.png'),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.blue[600],
        child:Image.asset('assets/ka.png'),
      ),
      Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.amber,
        child:Image.asset('assets/yam.png'),
      ),
       Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.cyan,
        child:Image.asset('assets/jo.png'),
      ),
       Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.purple,
        child:Image.asset('assets/yb.png'),
      ),
    /*  Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.cyan,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.blue,
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: Colors.grey,
      ),*/
    ];
    return Scaffold(

        appBar: AppBar(
            backgroundColor: Colors.grey[850],
            iconTheme: IconThemeData(color: Colors.white),
            title:Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.grey[850],

                      //Colors.lightBlueAccent,
                      // Colors.black,
                      // Colors.lightBlueAccent,
                      Colors.grey[850],
                    ])),
                height:30,
                child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width:20,
                        ),

                        Text( "YugiX",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w300,fontSize:23)),
                        Text(" Cards",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w300,fontSize:23)),
                        //  Text("  Broker",style:TextStyle(color:Colors.lightBlue,fontWeight:FontWeight.bold,fontSize:21)),
                      ],
                    ))
            ),
            //backgroundColor: Colors.lightBlueAccent,
            actions: <Widget>[
              SizedBox(
                height:10,
              ),

              IconButton(
                  color:Colors.amber,
                  icon: Icon(Icons.logout,size:32,),
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                         // return  startt();
                        }));

                  })



            ]
        ),
      backgroundColor:Colors.grey[850],
        body: Container(
          color:Colors.grey[850],
            child: Column(

              children: <Widget>[

                SizedBox(
                  height:10
                ),
               // Text(' YugiX Decks', style:TextStyle(color:Colors.red,fontSize:17,fontWeight:FontWeight.w300),),
                Expanded(
                  child: Card(
                    color:Colors.grey[850],
                    child: VerticalCardPager(
                      textStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                      titles: titles,
                      images: images,
                      onPageChanged: (page) {
                        print(page);
                      },
                      onSelectedItem: (index) {

                        if(index==0){
                        //  PostsScreen
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return d1();
                              }));
                        }

                        if(index==1){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return d2();
                              }));
                        }

                        if(index==2){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return d3();
                              }));
                        }

                         if(index==3){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return d4();
                              }));
                        }
                         if(index==4){
                           Navigator.push(
                           context,
                        MaterialPageRoute(builder: (context) {
                        return d5();
                        }));

                        }



                      },
                    ),
                  ),
                ),
              ],
            ),
        )
    );
  }}