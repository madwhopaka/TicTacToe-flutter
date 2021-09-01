import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GamePage.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/services.dart' ; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tic tac toe',
      home: splashScr(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class splashScr extends StatefulWidget {
  const splashScr({Key? key}) : super(key: key);

  @override
  _splashScrState createState() => _splashScrState();
}

class _splashScrState extends State<splashScr> {
  
Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.white;
    }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
       floatingActionButton: FloatingActionButton(backgroundColor: Colors.grey[900] ,child:  Text("<--"),onPressed: (){SystemNavigator.pop();}),
        backgroundColor: Colors.grey[900],
        body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: Text("Tic Tac Toe",
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.white70, fontSize: 26)))),
                  Container(
                        child: AvatarGlow(
                            endRadius: 150,
                            startDelay: Duration(seconds: 1),
                            shape: BoxShape.circle,
                            repeatPauseDuration: Duration(seconds: 2),
                            repeat: true,
                            animate: true,
                            duration: Duration(seconds: 2),
                            child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(style: BorderStyle.none),
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[900],
                                  child: Container(
                                      child: Image.asset(
                                    'images/splash.png',
                                     color:Colors.white, 
                                     fit: BoxFit.scaleDown,
                                  )),
                                  radius: 100,
                                )))),
                  
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: Text("@Madwho",
                              style: GoogleFonts.pressStart2p(
                                  color: Colors.white70, fontSize: 23)))),
                 SizedBox(
                   
                   width: 200 ,
                   height : 50  ,child: ElevatedButton(
                      child:ClipRRect(
                        borderRadius: BorderRadius.circular(20),child: Center(
                        child: Text("Play ", style: GoogleFonts.pressStart2p(color:Colors.grey[900])),
                      ),),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith(getColor)),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamePage()));
                      }),)
                ])));
  }
}
