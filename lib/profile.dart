
import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'adsManger.dart';
import 'colorr.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';




class profile extends StatefulWidget {

  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<profile> {
  String allposts;
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  String v;
  TextEditingController _searchController = TextEditingController();
  Future resultsLoaded;
  final _nativeAd=NativeAdmobController();
  AdmobBannerSize bannerSize;
  int money=0;
  int coins=0;
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobInterstitial intersitialAd;
  SharedPreferences prefs ;



  saveData(int coin) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('coin2',coin);
   // prefs.setInt('money',m);
  }
  saveData2(int m) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('money',m);
    // prefs.setInt('money',m);
  }

  getData()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
     // money =prefs.getInt('money')??money;
      coins =prefs.getInt('coin2')??coins;
    });
  }
  getData2()async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      money =prefs.getInt('money')??money;
     // coins =prefs.getInt('coins')??coins;
    });
  }
  RewardedVideoAd videoAd=RewardedVideoAd.instance;
  @override
  void initState() {

    FirebaseAdMob.instance.initialize(appId:'ca-app-pub-7757590907378676~5669556085');
    setState(() {
      getData();
      getData2();
    });


    RewardedVideoAd.instance.load(
        adUnitId:'	ca-app-pub-3940256099942544/5224354917',
        //'ca-app-pub-7757590907378676/2778691799',
        //AdmobReward.testAdUnitId,
        // "ca-app-pub-9553580055895935/1690226045",
        targetingInfo: MobileAdTargetingInfo());

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        coins=coins+rewardAmount;
      }
    };


    super.initState();
    bannerSize = AdmobBannerSize.BANNER;

    intersitialAd = AdmobInterstitial(
        adUnitId:  'ca-app-pub-7757590907378676/7279534119',
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.closed) intersitialAd.load();
          //  handleEvent(event, args, 'Interstitial');
        });
    _nativeAd.reloadAd(forceRefresh:true);
    intersitialAd.load();


    void showSnackBar(String content) {

      scaffoldState.currentState.showSnackBar(
        SnackBar(
          content: Text(content),
          duration: Duration(milliseconds: 2500),
        ),
      );
    }


    void handleEvent(
        AdmobAdEvent event, Map<String, dynamic> args, String adType) {
      switch (event) {
        case AdmobAdEvent.loaded:
          showSnackBar('New Admob $adType Ad loaded!');
          break;
        case AdmobAdEvent.opened:
          showSnackBar('Admob $adType Ad opened!');
          break;
        case AdmobAdEvent.closed:
          showSnackBar('Admob $adType Ad closed!');
          break;
        case AdmobAdEvent.failedToLoad:
          showSnackBar('Admob $adType failed to load. :(');
          break;
        case AdmobAdEvent.rewarded:
          showDialog(
            context: scaffoldState.currentContext,
            builder: (BuildContext context) {
              return WillPopScope(
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('Reward callback fired. Thanks Andrew!'),
                      Text('Type: ${args['type']}'),
                      Text('Amount: ${args['amount']}'),
                    ],
                  ),
                ),
                onWillPop: () async {
                  scaffoldState.currentState.hideCurrentSnackBar();
                  return true;
                },
              );
            },
          );
          break;
        default:
      }
    }




  }



  /*Future update(String newEmail) async {

    var message;
    FirebaseUser firebaseUser =await FirebaseAuth.instance.currentUser;
    firebaseUser
        .updateEmail(newEmail)
        .then(
          (value) => message = 'Success',
    )
        .catchError((onError) => message = 'error');
    return message;
  }
  Future update2(String newPass) async {
    var message;
    FirebaseUser firebaseUser =await FirebaseAuth.instance.currentUser;
    firebaseUser
        .updatePassword(newPass)
        .then(
          (value) => message = 'Success',
    )
        .catchError((onError) => message = 'error');
    return message;
  }*/
  @override
  void dispose() {
    intersitialAd.dispose();
    _nativeAd.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    /*final user = FirebaseAuth.instance.currentUser;
    final userData =FirebaseFirestore.instance.collection('users').doc(user.uid).get();*/

    return Scaffold(
      backgroundColor: Color.fromRGBO(41, 30, 83, 1),
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


      //drawer: SidebarPage(),

      body:
//       Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               btnforGroundColr,
//               btnbackGroundColr
//             ],
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(25)),
//         ),
//             //.fromRGBO(41, 30, 83, 1),
//         child: Column(
//             children: [
//               /* Container(
//                   width:200,
//                   height:60,
//                   child:NativeAdmob(
//                     adUnitID:AdsManger.nativeAdunit,
//                     numberAds:3,
//                     controller: _nativeAd,
//                     type:NativeAdmobType.banner,
//                   )
//               ),
// */
//               SizedBox(
//                 height:7,
//               ),

                //child: Expanded(



      Form(
        key: _formkey,
                                     child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            btnforGroundColr,
                                            btnbackGroundColr
                                          ],
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                      child: ListView(
                                        children: <Widget>[

                                          SizedBox(
                                              height:5
                                          ),
                                          Container(
                                              width:310,
                                              height:82,
                                              child:NativeAdmob(
                                                adUnitID:AdsManger.nativeAdunit,
                                                numberAds:3,
                                                controller: _nativeAd,
                                                type:NativeAdmobType.banner,
                                              )
                                          ),
                                          SizedBox(
                                              height:20
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width:10
                                              ),
                                              Container(
                                                  child:Text('Welcome ' +' to Win Cards Mode',style:TextStyle(color:Colors.black,fontSize:18,fontWeight:FontWeight.w400,fontStyle:FontStyle.italic),)
                                              ),
                                              
                                              SizedBox(
                                                  width:2
                                              ),
                                              Icon(Icons.ac_unit_rounded,color:Colors.red,),
                                               SizedBox(
                                                  width:3
                                              ),
                                              Container(
                                                width:90,
                                                child:Image.asset('assets/yy.png')
                                              )
                                            ],
                                          ),
                                           SizedBox(
                                              height:5
                                          ),



                                          SizedBox(
                                              height:20
                                          ),

                                          Row(
                                            children: [
                                              SizedBox(
                                                width:30,
                                              ),
                                              Container(
                                                width:100,
                                                height:112,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.red,
                                                      Colors.redAccent,
                                                    ],
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(70)),
                                                ),
                                               child:   FlatButton(
                                                   child: Center(
                                                     child: Text(
                                                       'Get Coins ',
                                                       style: TextStyle(
                                                           color: Colors
                                                               .white,
                                                           fontSize: 17,
                                                           fontWeight: FontWeight
                                                               .bold),),
                                                   )

                                                   , onPressed: () {
                                                 videoAd.load(
                                                     adUnitId:	'ca-app-pub-3940256099942544/5224354917'
                                                   //AdmobReward.testAdUnitId,
                                                  // 'ca-app-pub-7757590907378676/2778691799',
                                                     //RewardedVideoAd
                                                      //   .testAdUnitId
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
                                                     setState(() {
                                                       coins = coins + 1;
                                                          // rewardAmount;
                                                     });
                                                   }
                                                   saveData(coins);
                                                   saveData2(money);
                                                 };
                                               }
                                               ),
    ),
                                              SizedBox(
                                                width:80,
                                              ),
                                              Column(
                                                children: [

                                                  Container(
                                                      child:Text(coins.toString(),style:TextStyle(color:Colors.red,fontSize:22,fontWeight:FontWeight.w900),)
                                                  ),
                                                  SizedBox(
                                                    height:5,
                                                  ),
                                                  Container(
                                                      child:Text("Coins",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width:6,
                                              ),
                                              Column(
                                                children: [

                                                  Container(
                                                      child:Text(money.toString()+'',style:TextStyle(color:Colors.red,fontSize:22,fontWeight:FontWeight.w900),)
                                                  ),
                                                  SizedBox(
                                                    height:5,
                                                  ),
                                                  Container(
                                                      child:Text("Cards",style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),)
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                Transform(
                                                  transform: Matrix4.skewY(-0.05),
                                                  child: Container(
                                                    padding: EdgeInsets.all(24),
                                                    height: 310,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin: Alignment.topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          Colors.blue[600],
                                                          Colors.blue
                                                        ],
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(25)),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(top:18.0,left:15,right:15),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'WIN MONEY',
                                                        style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                                                      ),
                                                      SizedBox(
                                                          height:10
                                                      ),
                                                      Text(
                                                        'click to get coins then ',
                                                        style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),
                                                      ),
                                                     /* Text(
                                                        posts.data()['username'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300),
                                                      ),*/
                                                      SizedBox(
                                                          height:6
                                                      ),
                                                      /*Text(
                                                        posts.data()['email'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300),
                                                      ),*/
                                                      SizedBox(
                                                          height:6
                                                      ),
                                                      Text(
                                                        "Convert your Coins to Cards ",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300),
                                                      ),
                                                      SizedBox(
                                                          height:6
                                                      ),
                                                      Text(
                                                        "1000 coins =10 Cards",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w300),
                                                      ),
                                                      FlatButton(
                                                        color:Colors.red,
                                                          child: Text(
                                                            'Convert ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17,
                                                                fontWeight: FontWeight
                                                                    .bold),)

                                                          , onPressed: () async {
             
                                                          if(coins>=100) {
                                                            setState(() {
                                                              money = money +
                                                                  (coins ~/
                                                                      100);
                                                              coins = coins%100;
                                                              //coins = 0;

                                                            });
                                                            saveData(coins);
                                                            saveData2(money);
                                                          }
                                                          else
                                                            {
                                                              showDialog(
                                                                  context: context,
                                                                  builder: (_) => new CupertinoAlertDialog(
                                                                    title: new Text("Wrong "),
                                                                    content: new Text(" you should have more than or equal 100 coins to convert "),
                                                                  
                                                                  ));
                                                            }


                                                        saveData(coins);
                                                        saveData2(money);
                                                      }

                                                      ),


                                                      SizedBox(
                                                          height:20
                                                      ),
                                                     /* TextFormField(
                                                        controller: _emailcontroller,
                                                        autocorrect:true,
                                                        decoration: InputDecoration(
                                                          prefixIcon: Icon(Icons.email),

                                                          labelText:  "Enter paypal mail Or phone number",labelStyle:TextStyle(color:Colors.black,fontSize:14,fontWeight:FontWeight.w300),
                                                          enabledBorder: OutlineInputBorder
                                                            (borderSide: BorderSide(color: Colors.pinkAccent)),
                                                          border:OutlineInputBorder(
                                                            borderSide: const BorderSide(color: Colors.white,),
                                                            borderRadius: BorderRadius.circular(16.0),
                                                          ),
                                                        ),
                                                        validator: (value){
                                                          if(value.isEmpty){
                                                            return 'Fill your email or phone';
                                                          }
                                                          if(value.length<9){
                                                            return 'wrong ';
                                                          }

                                                          // return 'Valid Name';
                                                        },
                                                      ),
                                                      */
                                                     /* Container(
                                                        child:Text('OR')
                                                      ),
                                                      TextFormField(
                                                        controller: _emailcontroller,
                                                        autocorrect:true,
                                                        decoration: InputDecoration(
                                                          prefixIcon: Icon(Icons.email),

                                                          labelText:  " Enter your mobile number  ",
                                                          enabledBorder: OutlineInputBorder
                                                            (borderSide: BorderSide(color: Colors.pinkAccent)),
                                                          border:OutlineInputBorder(
                                                            borderSide: const BorderSide(color: Colors.white,),
                                                            borderRadius: BorderRadius.circular(16.0),
                                                          ),
                                                        ),
                                                        validator: (value){
                                                          if(value.isEmpty){
                                                            return 'Fill your mobile number';
                                                          }
                                                          if(value.length<6){
                                                            return 'wrong number';
                                                          }

                                                          // return 'Valid Name';
                                                        },
                                                      ),*/

                                                      FlatButton(
                                                        color:Colors.red,
                                                          child: Text(
                                                            ' Request to Recieve Cards ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 17,
                                                                fontWeight: FontWeight
                                                                    .bold),)

                                                          , onPressed: ()   {

                                                         if(money<10){
                                                            showDialog(
                                                                  context: context,
                                                                  builder: (_) => new CupertinoAlertDialog(
                                                                    title: new Text(" Sorry "),
                                                                    content: new Text(" you should have more than or equal 10 Cards to Request "),
                                                                  
                                                                  ));
                                                         }
                                                         else{

                                                        sendWhatsApp('+201097070465','hello i am using YugiX Cards and want to Win Cards');
                                                       
                                                         }




                                                      }

                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 57, right: 15, left: 70),
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
                                                           /* InkWell(
                                                              child: Transform(
                                                                transform: Matrix4.skewX(-0.05),
                                                                origin: Offset(50.0, 50.0),
                                                                child: Material(
                                                                  borderRadius:
                                                                  BorderRadius.all(Radius.circular(20)),
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.only(
                                                                        left: 30,
                                                                        right: 30,
                                                                        top: 10,
                                                                        bottom: 10),
                                                                    child: InkWell(
                                                                      child: Text(
                                                                        'make a deal',
                                                                        style: TextStyle(
                                                                            color: Colors.red.shade600,
                                                                            fontSize: 20,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              onTap:(){
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(builder: (context) {
                                                                      //  return two();
                                                                    }));
                                                              },
                                                            ),*/
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 190,
                                                  left: 220,
                                                  child: Image(
                                                    image: AssetImage('assets/money.png'),
                                                    height: 182,
                                                  ),
                                                ),



                                              ],
                                            ),
                                          ),
                                         
                                          SizedBox(
                                              height:10
                                          ),

                                      


                                        ],
                                      ),
    ),
                                   ));


                      }
                       sendWhatsApp(String phone,String msg)async{

    String url(){
      if(Platform.isAndroid){
        return 'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://wa.me/$phone/?text=${Uri.parse(msg)}';
      }
      else{
        return 'whatsapp://send?phone=$phone&text=$msg';
        //  return 'whatsapp://send?$phone=phone&text=$msg';
        //   return 'whatsapp://wa.me/$phone&text=$msg';
      }
    }

    await canLaunch(url())?launch(url()) : ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('there is no whats app in your device')));
  }
                      }



              //),

              // Container(
              //   color: Color.fromRGBO(41, 30, 83, 1),
              //   padding: const EdgeInsets.only(top:40),
              //   child: CurvedNavigationBar(
              //       color:Colors.indigo[900],
              //       backgroundColor: Color.fromRGBO(41, 30, 83, 1),
              //       //buttonBackgroundColor:Colors.blue,
              //       items:<Widget>[
              //         Icon(Icons.home,size:24,color:Colors.red),
              //         //  Icon(Icons.add_box,size:24,color:Colors.blue),
              //         Icon(Icons.messenger_rounded,size:24,color:Colors.red),
              //         // Icon(Icons.account_circle,size:24,color:Colors.white),
              //       ],
              //
              //       animationCurve:Curves.bounceOut,
              //       onTap:(index) async {
              //         final user = FirebaseAuth.instance.currentUser;
              //         final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
              //         String ud=userData['username'];
              //
              //
              //         /* if(index==1)
              //            {
              //              intersitialAd.show();
              //              Navigator.push(
              //                  context,
              //                  MaterialPageRoute(builder: (context) {
              //                return AddPost();
              //              }));
              //         }*/
              //         if(index==1){
              //           intersitialAd.show();
              //           Navigator.push(context, MaterialPageRoute(builder: (context) =>ChatScreen2(ud)));
              //         }
              //
              //       }
              //
              //   ),
              // )


