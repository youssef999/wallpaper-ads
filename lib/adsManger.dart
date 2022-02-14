//
//
// import 'dart:io';
// import 'package:admob_flutter/admob_flutter.dart';
//
//
// class AdsManger{
//
//    static bool _testmode= false;
//
//
//    static String get appIdEx{
//      if(Platform.isAndroid){
//        return "ca-app-pub-4801644190189400~6035455652";
//      }
//
//      else if(Platform.isIOS){
//        return"....";
//      }
//
//      else
//        {
//          throw new UnsupportedError("UNSUPPORTED PLATFORM");
//        }
//
//    }
//
//    static String get BannerAdUnitIdEX{
//
//       if(_testmode == true){
//        return "ca-app-pub-3940256099942544/6300978111";
//       }
//      else  if(Platform.isAndroid){
//         return "ca-app-pub-4801644190189400/8414206986";
//       }
//       else if(Platform.isIOS){
//         return"....";
//       }
//       else
//       {
//         throw new UnsupportedError("UNSUPPORTED PLATFORM");
//       }
//    }
//
//
//
//
//    static String get nativeAdunit{
//
//      if(_testmode == true){
//        return "ca-app-pub-3940256099942544/2247696110";
//
//          //NativeAdmob.testAdUnitId;
//      }
//      else  if(Platform.isAndroid){
//        return "ca-app-pub-4801644190189400/2473283462";
//      }
//      else if(Platform.isIOS){
//        return"....";
//      }
//      else
//      {
//        throw new UnsupportedError("UNSUPPORTED PLATFORM");
//      }
//    }
//
//    static String get interstitialAd{
//
//
//      if(_testmode == true){
//      //  return AdmobInterstitial.testAdUnitId;
//   return "ca-app-pub-3940256099942544/1033173712";
//      }
//
//      else  if(Platform.isAndroid){
//        return "ca-app-pub-4801644190189400/2337536180";
//      }
//
//      else if(Platform.isIOS){
//        return"....";
//      }
//      else
//      {
//        throw new UnsupportedError("UNSUPPORTED PLATFORM");
//      }
//    }
//
//
//  }