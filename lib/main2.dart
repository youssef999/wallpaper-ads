
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutt/decks.dart';
import 'package:flutt/decks2.dart';
import 'package:flutt/decks3.dart';
import 'package:flutt/profile.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'admob.dart';
//import 'package:startapp/startapp.dart';
import 'adsManger.dart';
import 'char.dart';
import 'diamond.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'two.dart';
import 'dart:async'; // <-- put  it on very top of your file

Timer _timerForInter;



const  String testDevice = 'Mobile_id';
Customadmob myCustomadmob=Customadmob();
InterstitialAd _interstitialAd;


class MyApp2 extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp2> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );
  final _nativeAd=NativeAdmobController();
  AdmobBannerSize bannerSize;
  AdmobInterstitial intersitialAd;
  SharedPreferences prefs ;

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }

 /* saveData(int coin) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('coin2',coin);
  }

  getData()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      coins =prefs.getInt('coin2')??coins;
    });

  }*/
 // RewardedVideoAd videoAd=RewardedVideoAd.instance;

  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId:'ca-app-pub-7757590907378676~5669556085');
    _timerForInter = Timer.periodic(Duration(seconds: 20), (result) {
      _interstitialAd = createInterstitialAd()..load();
    });

    /*RewardedVideoAd.instance.load(
        adUnitId:AdmobReward.testAdUnitId,
        // "ca-app-pub-9553580055895935/1690226045",
        targetingInfo: MobileAdTargetingInfo());

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        coins=coins+rewardAmount;
      }
    };
*/
    super.initState();
    intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
        listener:(AdmobAdEvent event , Map<String, dynamic> args ){
          if(event==AdmobAdEvent.closed) intersitialAd.load();
        } );
    intersitialAd.load();
    _nativeAd.reloadAd(forceRefresh:true);
  }

  /*updataData()async{
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    String ud=userData['username'];
    CollectionReference userRef=FirebaseFirestore.instance.collection("users");
    userRef.
    doc(userData.documentID).
    update({
      "coins":coins.toString() ,
    });
  }*/

  @override
  void dispose() {
 intersitialAd.dispose();
   _nativeAd.dispose();
 _interstitialAd.dispose();
    super.dispose();
  }
  showInterstialAd(){
    myCustomadmob.interstitialAd()
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:

        Center(child: Row(
          children: [
            SizedBox(
                width:40
            ),
            Text('   YugiX ', style: TextStyle(
                color: Colors.white,fontWeight:FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 23)),
            Text('  Cards', style: TextStyle(
                color: Colors.red,fontWeight:FontWeight.w300,
                fontStyle: FontStyle.italic,
                fontSize: 20)),
          ],
        )),
        backgroundColor:Colors.blue[900],
        elevation: 6,

      ),

         // .fromRGBO(41, 30, 80, 1),

     // drawer:SidebarPage2(),
      backgroundColor:Colors.blue[900],
      body: Container(
        margin: EdgeInsets.all(28),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

           Container(
                width:230,
                height:70,
                child:NativeAdmob(
                  adUnitID:AdsManger.nativeAdunit,
                  numberAds:3,
                  controller: _nativeAd,
                  type:NativeAdmobType.banner,
                )
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    height:5
                ),
                Text(
                  'Welcome to  YugiX Cards',
                  style:TextStyle(color:Colors.red,fontSize:24,fontWeight:FontWeight.w300),
                ),
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.orange,
                      size: 30,
                    ),
              ],
            ),

         /*   Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: <Widget>[
                    // Center(
                    //   child: Container(
                    //     height:110,
                    //     child: Image.asset('assets/money.png'),
                    //   ),
                    // ),
                    SizedBox(
                      width:30,
                    ),
                   Container(
                     //color:Colors.white,
                     width:130,
                     child:Expanded(child: Text('Making the deal that get coins and then change it to real money ',style:TextStyle(color:Colors.white,fontSize:13,fontWeight:FontWeight.w900),))
                   )
                   *//* Container(
                      child:Text('Coins'+coins.toString(), style: TextStyle(
                          color: Colors
                          .white,
                          fontSize: 17,
                          fontWeight: FontWeight
                              .bold),)
                    ),*//*
                    // Column(
                    //   children:<Widget>[


                       *//* SizedBox(
                          height:10,
                        ),
                        FlatButton(
                            child: Text(
                              'Get Coins ',
                              style: TextStyle(
                                  color: Colors
                                      .white,
                                  fontSize: 17,
                                  fontWeight: FontWeight
                                      .bold),)

                            , onPressed: () {
                          videoAd.load(
                              adUnitId: RewardedVideoAd
                                  .testAdUnitId
                          );

                          //updataData();
                          videoAd.show();
                          RewardedVideoAd.instance
                              .listener =
                              (
                              RewardedVideoAdEvent event,
                              {String rewardType, int rewardAmount}) {
                            if (event ==
                                RewardedVideoAdEvent
                                    .rewarded) {
                              coins = coins +
                                  rewardAmount;
                            }
                            saveData(coins);
                          };
                        }

                        ),
                      ]
                    )*//*

                  ],
                ),
              ),
            ),*/
            SizedBox(
              height:20
            ),
            Row(
              children:<Widget> [
                Container(
                     height:110,
                      child: Image.asset('assets/ca.png'),
                    ),
                SizedBox(
                  width:12,
                ),
                InkWell(
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.transparent
                              ],
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                          ),
                         height:50,
                         width:130,
                         child: Center(child: Text(' Win Cards ',style:TextStyle(color:Colors.white,fontSize:19,fontWeight:FontWeight.w300),))),
                  onTap :(){
                    showInterstialAd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return profile();
                        }));
                    }
                  ),
              ],
            ),
           
           
            SizedBox(
                height:10
            ),

           
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.red,
                            Colors.black,
                            //  Color.fromRGBO(209, 4, 43, 1),
                            //  Color.fromRGBO(214, 61, 99, 1),
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Characters',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          '  ' ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),),
                        Text( 'to choose the best for you ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See Characters ',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                onTap:() async {

                                  showInterstialAd();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return char();
                                      }));
                                 // showInterstialAd();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 70,
                    left: 185,
                    child: Image(
                      image: AssetImage('assets/ym.png'),
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black,
                            Colors.cyan,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' How to Play ',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Yugi oh rules ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'know how you can duel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See How to play',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),


                                      ),
                                    ),
                                  ),
                                ),
                                onTap:() async {
                                  showInterstialAd();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return two();
                                      }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 170,
                    child: Image(
                      image: AssetImage('assets/rb.png'),
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Decks',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'See  ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'Old School Decks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'the best YugiX Cards',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              Transform(
                                transform: Matrix4.skewX(-0.05),
                                origin: Offset(50.0, 50.0),
                                child: Material(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 10,
                                        bottom: 10),
                                    child: InkWell(
                                      child: Text(
                                       'See Decks',
                                        style: TextStyle(
                                            color: Colors.red.shade600,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap:() async {
                                        showInterstialAd();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                            return decks1();
                                            }));

                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 72,
                    left: 165,
                    child: Image(
                      image: AssetImage('assets/ddk.png'),
                      height:130,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.pink,
                            Colors.purple,
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Gx Decks',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Find out Gx Best Decks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'lovely school decks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              Transform(
                                transform: Matrix4.skewX(-0.05),
                                origin: Offset(50.0, 50.0),
                                child: Material(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                        top: 10,
                                        bottom: 10),
                                    child: InkWell(
                                      child: Text(
                                        'See Decks',
                                        style: TextStyle(
                                            color: Colors.red.shade600,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onTap:() async {

                                        showInterstialAd();
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) {
                                               return decks2();
                                            }));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 90,
                    left: 165,
                    child: Image(
                      image: AssetImage('assets/fl.png'),
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Transform(
                    transform: Matrix4.skewY(-0.05),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.brown,
                            Colors.black12,
                            //  Color.fromRGBO(209, 4, 43, 1),
                            //  Color.fromRGBO(214, 61, 99, 1),
                            //Color.fromRGBO(209, 4, 43, 1),
                            // Color.fromRGBO(214, 61, 99, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:12
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Special Decks',
                          style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                        ),
                        Text(
                          'Know the new School Decks' ,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                        Text(
                          'decks with new school strategy ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 15, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              /*  CircularPercentIndicator(
                                radius: 55.0,
                                lineWidth: 6.0,
                                animation: true,
                                percent: 0.2,
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: Colors.black87,
                              ),

                             */
                              InkWell(
                                child: Transform(
                                  transform: Matrix4.skewX(-0.05),
                                  origin: Offset(50.0, 50.0),
                                  child: Material(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      child: InkWell(
                                        child: Text(
                                          'See Decks',
                                          style: TextStyle(
                                              color: Colors.red.shade600,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                onTap:() async {
                                  showInterstialAd();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                          return decks3();
                                      }));
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 200,
                    child: Image(
                      image: AssetImage('assets/ch.png'),
                      height: 110,
                    ),
                  ),
                ],
              ),
            ),

          
         Container(
                width:230,
                height:70,
                child:NativeAdmob(
                  adUnitID:AdsManger.nativeAdunit,
                  numberAds:3,
                  controller: _nativeAd,
                  type:NativeAdmobType.banner,
                )
            ),
          ],
        ),
      ),
    );
  }
}