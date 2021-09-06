
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'adsManger.dart';




class d6 extends StatefulWidget {


  @override
  _MyApp7State createState() => _MyApp7State();
}

class _MyApp7State extends State<d6> {




 final _nativeAd=NativeAdmobController();

  AdmobBannerSize bannerSize;

  AdmobInterstitial intersitialAd;

  @override
  void initState() {
    super.initState();
 intersitialAd =AdmobInterstitial(adUnitId: AdsManger.interstitialAd,
        listener:(AdmobAdEvent event , Map<String, dynamic> args ){
          if(event==AdmobAdEvent.closed) intersitialAd.load();
        } );
    intersitialAd.load();
    _nativeAd.reloadAd(forceRefresh:true);
  }

  @override
  void dispose() {
   intersitialAd.dispose();
    _nativeAd.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
  //final name=basename(widget.file.path);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
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
          body:
              Container(
                  child:PDF(
                      enableSwipe: true,
                      swipeHorizontal: false,
                      autoSpacing: false,
                      pageFling: false,

                    ).fromAsset(
                      'assets/yugihero.pdf',
                      errorWidget: (dynamic error) => Center(child: Text(error.toString())),
                    ),

      ),

      ));
  }
}
