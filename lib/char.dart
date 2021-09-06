
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'admob.dart';
import 'adsManger.dart';

class char extends StatefulWidget {

  @override
  _charState createState() => _charState();
}

class _charState extends State<char> {
    String img;

    String txt;

    String txt2;

    String txt3;

    String txt4;


   final _nativeAd=NativeAdmobController();

    AdmobBannerSize bannerSize;

   AdmobInterstitial intersitialAd;
    String testDevice = 'Mobile_id';
    Customadmob myCustomadmob=Customadmob();


    @override
    void initState() {
      showInterstialAd();
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
    showInterstialAd(){
      myCustomadmob.interstitialAd()
        ..load()
        ..show(
        //  anchorType: AnchorType.bottom,
          anchorOffset: 0.0,
          horizontalCenterOffset: 0.0,
        );
    }

   @override
   Widget build(BuildContext context) {
     return DefaultTabController(
       length:8,
       child: Scaffold(
         backgroundColor:Colors.blue[900],
         appBar:AppBar(
           title:Center(child: Text('YugiX   Cards',style:TextStyle(color:Colors.white,fontSize:23,fontWeight:FontWeight.w300),)),
           backgroundColor:Colors.blue[900],
           bottom:TabBar(
              indicatorWeight:7,
               isScrollable:true,
               tabs:<Widget>[
                Tab(text:'Yami Yugi'),
                Tab(text:'Jaden Yuki'),
                 Tab(text:'Yusei Fudo'),
                 Tab(text:'Yuma Tsukumo'),
                 Tab(text:'Aster Phoenix'),
                 Tab(text:'Yuya Sakaki'),
                 Tab(text:'Seto Kaiba'),
                 Tab(text:'Yugi Muto')
               /*  Tab(text:'NIKITA'),
                 Tab(text:'MISHA'),
                 Tab(text:'MAXIM'),
                 Tab(text:'KLA'),
                 Tab(text:'PALOMA'),
                 Tab(text:'MIGUEL'),
                 Tab(text:'CAROLINE'),
                 */
           ]),
         ),
         body:TabBarView(
             children:<Widget> [

               _buildWithName('Yami Yugi'),
               _buildWithName('Jaden Yuki'),
               _buildWithName('Yusei Fudo'),
               _buildWithName('Yuma Tsukumo'),
               _buildWithName('Aster Phoenix'),
               _buildWithName('Yuya Sakaki'),
               _buildWithName('Seto Kaiba'),
               _buildWithName('Yugi Muto'),
/*
               _buildWithName('NIKITA'),
               _buildWithName('MISHA'),
               _buildWithName('MAXIM'),
               _buildWithName('KLA'),
               _buildWithName('PALOMA'),
               _buildWithName('MIGUEL'),
               _buildWithName('CAROLINE'),
               */
             ],
         ),
       ),
     );
   }

 ListView _buildWithName(String s) {
     if(s=='Yami Yugi'){
       img='assets/yy.png';
       txt='Yami Yugi';
       txt2='The young and steely-eyed Yami Yugi is an extraordinary and confident duelist who fights the ultimate battle at the Shadow Games. But who is Yami Yugi? ';
       txt3=' The spirit confined within the Millennium Puzzle is the spirit of the ancient Egyptian Pharaoh that locked away the Shadow Games millennia ago.';
       txt4='this Character is tremendously useful for lovers of duels . if you try to have weapons with large magazines , in a long exchange you will end up doing more damage than your opponent , even if you have the same weapon';
     }
     if(s=='Jaden Yuki'){
       img='assets/jy.png';
       txt='Jaden Yuki';
       txt2='Jaden lives in the lowest-ranked Slifer Red dormitory because he gets bad grades' ;
       txt3 ='but he’s out to prove that test scores aren’t everything! His superior dueling skills and incredible instincts are unlike anything the teachers have seen before, and he’s ready to rock Duel Academy to its foundation! ';




      //he true meaning of life. He wants to be a free spirit and hopes that he can also help bring other humans closer to nature through his birds.';
     }
     if(s=='Yusei Fudo'){
       img='assets/yf.png';
       txt='Yusei Fudo';
       txt2='Yusei is a cool, quiet, technically savvy, master mechanic and Turbo Duelist extraordinaire';
       txt3=' He is a soft-spoken and smart duelist whose actions speak louder than his words. For the most part, Yusei tends to keep a low profile ';
       txt4=' spending most of his spare time modifying and tricking out his Duel Runner';
     }
     if(s=='Yuma Tsukumo'){
       img='assets/yt.png';
       txt='Yuma Tsukumo ';
       txt2='Every boy has a dream. For Yuma, his dream is to become the world’s greatest duelist';
       txt3=' he more than makes up for his inexperience by feeling the flow and dueling with the passion of a pro and the attitude of an ace.';
       txt4=' That’s why no matter how powerful the opponent, Yuma is always ready to take them on – even if his skills are a little off!';
     }
     if(s=='Aster Phoenix'){
       img='assets/as.png';
       txt='Aster Phoenix';
       txt2='Aster Phoenix is a world famous, top-ranking professional duelist. He is adored by fans around the globe';
       txt3='and his celebrity status has done wonders for the game by introducing it to the masses. But why would a successful professional duelist ';
       txt4=' enroll as a freshman at Duel Academy? There must be more to this dueling pro than meets the eye!';
     }
     if(s=='Yuya Sakaki'){
       img='assets/ys.png';
       txt='Yuya Sakaki';
       txt2= ' Yuya Sakaki is a sharp and spirited duelist who hopes to be the greatest dueltainer the world has ever seen! Whenever Yuya takes center stage';
      txt3='Yuya is set to swing into action and take the world of Action Duels by storm! ';
     // txt4='Kelly is real name is Shimada Kiriko. She is a teenager, still a student. She is an elite athlete who does not stop training on the athletics track or at the academy, making her the fastest character in Free Fire. Playing as Kelly will be the best option if we want to get to sites before others or have an advantage in any chase on foot.';
     }
     if(s=='Seto Kaiba'){
       img='assets/ka.png';
       txt='Seto Kaiba';
       txt2='Even though Kaiba is the wealthy CEO of his own multinational high-tech corporation KaibaCorp that invented the virtual reality duel system,';
       txt3='his real passions lay in the world of Duel Monsters. He uses his ruthless business drive to overcome any who challenge him. ';
       txt4='Kaiba wants to be the greatest and most powerful duelist in history, and he knows that Yugi will be his eternal rival.';
     }
     if(s=='Yugi Muto'){
       img='assets/ym.png';
       txt='Yugi Muto';
       txt2='If there was ever a kid born to play Duel Monsters, Yugi is that kid.  ';
       txt3= 'When Yugi was growing up, his grandfather gave him ';
       txt4=' an ancient Egyptian artifact called the “Millennium Puzzle” to solve.';
     }

    /* if(s=='NIKITA'){
       img='assets/n1.png';
       txt='NIKITA';
       txt2='Special Ability: Nikita has the ability to recharge sub-machine guns more quickly, a real advantage in a one-on-one situation. ';
     txt3='Price: 2500 coins or 499 diamonds. ';
     txt4='Nikita is the professional bodyguard of Carolyn, the daughter of the president of the Free Fire organization. She has learned to use different weapons since she was a child, becoming a champion in different competitions.  This woman is useful for those of us who want to make the most of a submachine gun is shooting cadence and magazine, but watch your ammunilion!';
     }

     if(s=='MISHA'){
       img='assets/mish.jfif';
       txt='MISHA';
       txt2='Special Ability: All vehicles driven by Misha reach a higher speed and receive less damage. ';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Misha is a racing specialist, a very brave girl who loves speed and loves to leave all opponents under a cloud of dust. For her there are no curves, only straight roads. She is a suitable character for those of us who use vehicles frequently and are speed lovers. Hold on!';
     }
     if(s=='MAXIM'){
       img='assets/ff1.png';
       txt='MAXIM';
       txt2='Special Skill: Maxim takes less time to heal or eat a mushroom to earn EP points.';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Maxim is a regular competitor in con-tests who eats more, plus a very funny and smiling gamer. He loves streaming while playing against players from all over the world. But do not be fooled: if you think that by being bigger than him you Are going to beat him in a food contest, you are wrong. Maxim is the best for those of us who base our game on stockpiling supplies.';
     }
     if(s=='KLA'){
       img='assets/kl1.png';
       txt='KLA';
       txt2='Special Ability: Kla is punches cause the most damage throughout the game, which is essential for the first few minutes of each game. ';
       txt3='Price: 8000 coins or 499 diamonds.';
       txt4='Kla is a lonely man and a very experienced Muay Thai wrestler. He disappeared for years until he wanted to reappear, although totally changed: he has decided to take revenge with his own hands. This man is the best for those of us who like to land in places full of players; however, beware of ending up surrounded by bullets!';
     }
     if(s=='PALOMA'){
       img='assets/pa1.jpg';
       txt='PALOMA';
       txt2='Special skill: to be able to carry more AR bullets, as not all of them will take up space in our inventory. ';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Paloma is an arms dealer, as beautiful as she is deadly. Years ago she was a model woman that all girls idolized, until one day she wanted to become an expert in buying and selling weapons. If there is illegal business in one place, Paloma will be there to benefit in every possible way. For those of us who want to have an advantage in ammunition and la longer in shooting exchanges, there is no one better than Paloma.';

     }
     if(s=='MIGUEL'){
       img='assets/mi1.jpg';
       txt='MIGUEL';
       txt2='Special Ability: For each enemy eliminated, Miguel gets EP points, which the rest of the characters can only get by eating a mushroom.';
       txt3='Price: 8000 coins or 499 diamonds. ';
       txt4='Miguel is a very lethal and highly trained Special Forces soldier. He, along with the comrades of his battalion, has managed to bring justice against terrorists with great efficiency, throughout his career... until one day everything went wrong. Those of us who like to play aggressively and hunt down many, enemies, this is our character.';
     }
     if(s=='CAROLINE'){
       img='assets/ca1.jpg';
       txt='CAROLINE';
      txt2='Special ability: can move faster whencarrying a shotgun in hand.';
      txt3='Price: 499 diamonds.';
       txt4='Caroline is a very, very rich girl and spends her life surrounded by fans and numerous bodyguards. She is very close to her father and brother, and loves to do cosplay.This young woman, one of the lasmembers in the ranks of Free Fire  will be our best ally if we opt for close focombat and exploration of buildings';
     }
*/

   return ListView(
       children: <Widget>[
         Column(
           children: <Widget>[
             Container(
                 width:310,
                 height:81,
                 child:NativeAdmob(
                   adUnitID:AdsManger.nativeAdunit,
                   numberAds:3,
                   controller: _nativeAd,
                   type:NativeAdmobType.banner,
                 )
             ),
             SizedBox(
                 height:5
             ),
             SizedBox(
               height:10,
             ),
             Container(
               child:  Text(txt,style:TextStyle(color:Colors.white,fontSize:17,fontWeight:FontWeight.w900),),
             ),
            Container(
              height:300,
              width:400,
              child: Image.asset(img),
            ),


             SizedBox(
               height:10,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt2,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             ),
             SizedBox(
               height:3,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt3,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             ),
             SizedBox(
               height:3,
             ),
             Container(
               child:  Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(txt4,style:TextStyle(color:Colors.white,fontSize:14,fontWeight:FontWeight.w400),),
               ),
             ),
            
           ],
         )
       ]);
 }}
