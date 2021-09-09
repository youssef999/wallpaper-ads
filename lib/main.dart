
import 'package:flutt/main3.dart';
import 'package:flutter/material.dart';




Future<void> main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:main3 (),
       debugShowCheckedModeBanner: false,
    );
  }
}
