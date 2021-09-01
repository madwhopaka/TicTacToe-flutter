import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictac/main.dart';

class GamePage extends StatefulWidget {
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  List<String> xoro = ['', '', '', '', '', '', '', '', ''];
  bool xnoto = true;
  int x = 0;
  int o = 0;
  int filledBox = 0;
  var myTextStyle =
      GoogleFonts.pressStart2p(color: Colors.white60, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.grey[900],
        body: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Player X", style: myTextStyle),
                        Text("Player O", style: myTextStyle),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(x.toString(), style: myTextStyle),
                      Text(o.toString(), style: myTextStyle),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                            onTap: () {
                              tapped(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  color: Colors.grey,
                                )),
                                child: Center(
                                    child: Text(xoro[index],
                                        style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white70)))));
                      }),
                )),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tic Tac Toe",
                  style: myTextStyle,
                )),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "@CreatedByMadhu",
                    style: myTextStyle,
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.grey[900],
            child: Text("<--"),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => splashScr()));
            }));
  }

  void tapped(int index) {
    setState(() {
      if (xnoto == true && xoro[index] == '') {
        xoro[index] = 'x';
        filledBox += 1;
      } else if (xnoto == false && xoro[index] == '') {
        xoro[index] = 'o';
        filledBox += 1;
      }

      xnoto = !xnoto;

      checkwin();
    });
  }

  void checkwin() {
    if (xoro[0] == xoro[1] && xoro[0] == xoro[2] && xoro[0] != '') {
      _showWin(0);
    } else if (xoro[0] == xoro[3] && xoro[0] == xoro[6] && xoro[0] != '') {
      _showWin(0);
    } else if (xoro[3] == xoro[4] && xoro[3] == xoro[5] && xoro[3] != '') {
      _showWin(3);
    } else if (xoro[6] == xoro[7] && xoro[6] == xoro[8] && xoro[6] != '') {
      _showWin(6);
    } else if (xoro[1] == xoro[4] && xoro[1] == xoro[7] && xoro[1] != '') {
      _showWin(1);
    } else if (xoro[2] == xoro[5] && xoro[2] == xoro[8] && xoro[2] != '') {
      _showWin(2);
    } else if (xoro[0] == xoro[4] && xoro[0] == xoro[8] && xoro[0] != '') {
      _showWin(0);
    } else if (xoro[2] == xoro[4] && xoro[2] == xoro[6] && xoro[2] != '') {
      _showWin(2);
    } else if (filledBox == 9) {
      showDraw();
    }
  }

  void showDraw() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("That is A Draw"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Play Again"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    clearscreen();
                  })
            ],
          );
        });
  }

  void _showWin(int index) {
    if (xoro[index] == 'x') {
      x += 1;
    } else {
      o += 1;
    }
    var winner;
    if (xoro[index] == 'o')
      winner = "O";
    else
      winner = "X";
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner + " Wins !"),
            actions: <Widget>[
              FlatButton(
                  child: Text("Play Again"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    clearscreen();
                  })
            ],
          );
        });
  }

  void clearscreen() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xoro[i] = '';
      }
      filledBox = 0;
      var round_winner;
      if (x == 5 || o == 5) {
        if (x == 5)
          round_winner = "PlayerOne";
        else
          round_winner = "PlayerTwo";
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(round_winner + " won the round"),
                actions: <Widget>[
                  FlatButton(
                      child: Text("Go Back"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => splashScr()));
                      })
                ],
              );
            });
      }
    });
  }
}
