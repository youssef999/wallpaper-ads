
import 'package:flutter/material.dart';

import 'main2.dart';



Future<void> main()  {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp2 (),
       debugShowCheckedModeBanner: false,
    );
  }
}
