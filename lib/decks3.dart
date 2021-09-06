
import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'd9.dart';
import 'd10.dart';
import 'd11.dart';

class decks3 extends StatelessWidget {
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

      "Dark Magician",
      "Blue eyes",
      "Galaxy Eyes",
      
      
      //"CYAN",
     // "BLUE",
     // "GREY",
    ];

    final List<Widget> images = [
      Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.red,
        child:Image.asset('assets/dm.png'),
      ),
      Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.blue[600],
        child:Image.asset('assets/cy.png'),
      ),
      Card(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color:Colors.cyan,
        child:Image.asset('assets/gal.png'),
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

                        Text( "YugiX ",style:TextStyle(color:Colors.white,fontWeight:FontWeight.w300,fontSize:21)),
                        Text(" Cards",style:TextStyle(color:Colors.red,fontWeight:FontWeight.w300,fontSize:21)),
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
                  height:20
                ),
               // Text(' Photographer Hassan App', style:TextStyle(color:Colors.red,fontSize:17,fontWeight:FontWeight.w300),),
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
                                return d9();
                              }));
                        }

                        if(index==1){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                               return d10();
                              }));
                        }

                        if(index==2){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                              return d11();
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