import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutt/register2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main2.dart';



class LoginScreen extends StatefulWidget{

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {




  final _formkey = GlobalKey<FormState>();


  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  saveData(String e,String p) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email',e);
    prefs.setString('pass',p);
  }

  getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    setState(() {

      _emailcontroller =prefs.getString('email') as TextEditingController;
      _passwordcontroller=prefs.getString('pass') as TextEditingController;

      if( _emailcontroller!=null && _passwordcontroller!=null) {
        if (userData['choose'] == 'Customer') {
          String ud = userData['username'];
          print('welcomee');
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MyApp2();
              }));
        }
      }
  });
  }

   @override
  void initState() {
     getData();
    super.initState();
  }

  /*@override
  void dispose()
  {
    _emailcontroller.dispose();

    _passwordcontroller.dispose();

    super.dispose();
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:

          Center(child: Row(
            children: [
              SizedBox(
                  width: 40
              ),
              Text('  FIRE cash', style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
              Text(' & guide', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontSize: 20)),
            ],
          )),
          backgroundColor: Colors.black,
          elevation: 6,

        ),

        // .fromRGBO(41, 30, 80, 1),

       // drawer: SidebarPage(),
        backgroundColor: Color.fromRGBO(41, 30, 83, 1),
        body: Container(
            color: Colors.blue[900],
            padding: EdgeInsets.all(10),
            child: Form(
                key: _formkey,
                child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 7,
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
                                      Colors.lightBlueAccent,
                                      Colors.blue
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(Radius
                                      .circular(25)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' FOR Admin Only',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  /* Text(
                            'Find out how to become the best ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            'Free Fire player with these tips',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),*/

                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, right: 15, left: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
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
                                        /*  InkWell(
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
                                            'See Tips and Tricks',
                                            style: TextStyle(
                                                color: Colors.red.shade600,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),


                                        ),
                                      ),
                                    ),
                                  ),

                                ),*/
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 55,
                              left: 220,
                              child: Image(
                                image: AssetImage('assets/admin.png'),
                                height: 77,
                              ),
                            ),
                          ],
                        ),
                      ),

                      /*Container(
            child:Card(
              child:Text('FOR ADMIN ONLY ',style:TextStyle(color:Colors.black,fontSize:17,fontWeight:FontWeight.w900),)
            )
          ),*/

                      SizedBox(
                          height: 5
                      ),

                      /* Container(
           color: Colors.indigo,
            height:210,
            child:Row(
              children:<Widget> [
                Container(
                    child: Expanded(child: Image.asset('assets/s12.png'))),
                SizedBox(
                  width:10,
                ),
                Container(
                    height:210,
                    child: Expanded(child: Image.asset('assets/l1.jfif'))),
              ],
            ),
          ),*/
                      SizedBox(
                          height: 10
                      ),
                      /* RichText( */ /*Swap Broker*/ /*
          textAlign: TextAlign.center,
          text: TextSpan(
          text: _language.tlanguage()?? "MA",
          style:TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Colors.lightBlueAccent[200]
          ),
          children: [
            TextSpan(
              text: _language.tlanguage2() ?? "LL" ,
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),

          ],
        ),

      ),
      SizedBox(
        height:10,
      ),

                  Container(
                    height:98,
                    width:200,
                    child:Image.asset('assets/mall1x.jpg'),
                  ),
              SizedBox(
                height:15,
              ),*/

                      TextFormField(/*/Email*/
                        controller: _emailcontroller,
                        cursorColor: Colors.red,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1.3),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                              Icons.person, color: Colors.redAccent),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Fill Email Input';
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(/*Password*/
                        cursorColor: Colors.red,

                        obscureText: true,
                        controller: _passwordcontroller,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white,
                                width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          fillColor: Colors.white,
                          filled: true,

                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey,),
                          prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Fill Password Input';
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),


                      FlatButton(/*Login button*/

                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            WidgetsFlutterBinding.ensureInitialized();
                            await Firebase.initializeApp();
                            var result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: _emailcontroller.text,
                                password: _passwordcontroller.text);
                            final user = FirebaseAuth.instance.currentUser;
                            final userData = await FirebaseFirestore.instance
                                .collection('users').doc(user.uid).get();
                            if (result != null) {
                              if (userData['email'] ==
                                  'qaradaya2002@gmail.com'.trim()) {
                                String ud = userData['username'];
                                print('welcomee');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                     // return ChatScreen2(ud);
                                    }));
                              }

                              else if (userData['email'] !=
                                  'qaradaya2002@gmail.com') {
                                String ud = userData['username'];
                                print('welcomee' + userData.toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return MyApp2();
                                    }));
                              }
                            }
                            else {
                              print('user not found');
                            }
                          }
                        },

                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 2,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(
                                  Radius.circular(16)),
                              boxShadow: <BoxShadow>[
                                /*BoxShadow(
    color: Colors.blueGrey,
    offset: Offset(2,4),
    blurRadius: 5,
    spreadRadius: 2 )*/
                              ],
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors:
                                  [
                                    Colors.blue,
                                    Colors.lightBlueAccent,
                                  ])
                          ),
                          child: Text("Login", style: TextStyle(fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                     /* Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: <Widget>[
                              SizedBox(width: 20,),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Text("O R", style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.italic),),
                                onTap:(){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return RegisterScreen2();
                                      }));
                                },
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ),

                            ],
                          )
                      )*/
                    ]))));
  }
}
//              /* Center(
//                 child: Text( "O R",style: TextStyle(
//                     color:Colors.red,
//                     fontSize:22,fontWeight: FontWeight.w700,fontStyle:FontStyle.italic),),
//               ),
//     SizedBox(
//     height:5,
//     ),
//     *//*FlatButton(//FacebookButton/
//     onPressed: () {  },
//     *//**//*child: Container(
//     height: 50,
//     margin: EdgeInsets.symmetric(vertical:20),
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.all(Radius.circular(10)),
//     ),
//     *//**//**//**//*child: Row(
//     children: <Widget>[
//     Expanded(
//     flex: 1,
//     child: Container(
//     decoration: BoxDecoration(
//     color: Color(0xff1959a9),
//     borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
//     ),
//     alignment: Alignment.center,
//     child: Text('f',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w400)),
//     ),
//     ),
//     Expanded(
//     flex: 5,
//     child: Container(
//     decoration: BoxDecoration(
//     color: Color(0xff2872ba),
//     borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),topRight: Radius.circular(5)),
//     ),
//     alignment: Alignment.center,
//     child: Text(
//     'Log in with Facebook',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)
//     ),
//     ),
//     ),
//     ],
//     ),*//**//**//**//*
//     ),*//**//*
//     ),*//*
//     SizedBox(
//     height:3,
//     ),
//
//               FlatButton(
//
//     onPressed: () async {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
//     },
//     child: Container(
//     margin: EdgeInsets.symmetric(vertical:20),
//     //padding: EdgeInsets.only(left:15,bottom:15,right:15),
//     //alignment: Alignment.bottomCenter,
//     child: Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: <Widget>[
//     Text(
//      "Don't have an account",style: TextStyle(
//         color:Colors.blueAccent,
//         fontSize:18,fontWeight: FontWeight.w600,fontStyle:FontStyle.italic),
//     ),
//     SizedBox(
//     width: 10,
//     ),
//     Text( "Register",style: TextStyle(
//       color:Colors.white,
//         fontSize:18,fontWeight: FontWeight.w400,fontStyle:FontStyle.italic),
//     ),
//     ],
//     ),
//     ),
//     )
//
//     ],
//     )
//     ),
//     ),
//     );
//   }
//
//
//
// }
//
//
// /*import 'package:fire99/new1.dart';
// import 'package:fire99/register.dart';
// import 'package:fire99/register2.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dashboard.dart';
//
// class LoginScreen extends StatefulWidget{
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().whenComplete(() {
//       print("completed");
//       setState(() {});
//     });
//   }
//
//
//   final _formkey = GlobalKey<FormState>();
//
//   TextEditingController _emailcontroller = TextEditingController();
//
//   TextEditingController _passwordcontroller = TextEditingController();
//
//   @override
//   void dispose()
//   {
//     _emailcontroller.dispose();
//
//     _passwordcontroller.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login To My Account'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Form(
//             key: _formkey,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   controller: _emailcontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Email',
//                   ),
//                   validator: (value) {
//                     if(value.isEmpty){
//                       return 'Please Fill Email Input';
//                     }
//
//
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   controller: _passwordcontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Password',
//                   ),
//                   validator: (value){
//                     if(value.isEmpty){
//                       return 'Please Fill Password Input';
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text('Login',style: TextStyle(color: Colors.white),),
//                   onPressed: () async {
//
//                     if(_formkey.currentState.validate()){
//
//                     WidgetsFlutterBinding.ensureInitialized();
//                      await Firebase.initializeApp();
//
//                       var result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
//
//                      if(result != null)
//                      {
//                         // pushReplacement
//                           print('welcomee');
//                         Navigator. push(
//                            context,
//                           MaterialPageRoute(builder: (context) => DashboardScreen()),
//                        );
//
//                      }
//                      else{
//                        print('user not found');
//                       }
//                     }
//                   },
//                 ),
//                 RaisedButton(
//                     child: Text('start '),
//                     color: Colors.blue,
//                     onPressed:(){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
//                     }
//
//                 ),
//
//                 RaisedButton(
//                     child: Text('show '),
//                     color: Colors.blue,
//                     onPressed:(){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => new1()));
//                     }
//
//                 ),
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text('Register New Account',style: TextStyle(color: Colors.white),),
//                   onPressed: () async {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen() ) );
//                   },
//                 ),
//                 RaisedButton(
//                   color: Colors.blue,
//                   child: Text('Register New Account 2 ',style: TextStyle(color: Colors.white),),
//                   onPressed: () async {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen2() ) );
//                   },
//                 )
//
//               ],
//             )
//         ),
//       ),
//     );
//     */
