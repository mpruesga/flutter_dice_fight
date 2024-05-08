import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  // Do not add a build method, add a createState method
  @override 
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }

}

// private class
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';
  var currentDiceRoll = 2;
  var activeDiceImage2 = 'assets/images/dice-2.png';
  var currentDiceRoll2 = 2;
  var activeDiceImage3 = 'assets/images/dice-2.png';
  var currentDiceRoll3 = 2;
  var activeDiceImage4 = 'assets/images/dice-2.png';
  var currentDiceRoll4 = 2;

  void rollDice1() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // Value between 1 and 6
      currentDiceRoll2 = randomizer.nextInt(6) + 1; // Value between 1 and 6
    });
  }

  void rollDice2() {
    setState(() {
      currentDiceRoll3 = randomizer.nextInt(6) + 1; // Value between 1 and 6
      currentDiceRoll4 = randomizer.nextInt(6) + 1; // Value between 1 and 6
    });
    
  }

  var blue_score = 0;
  var red_score = 0;
  var win = "";
  void winner(){
    blue_score = currentDiceRoll+currentDiceRoll2;
    red_score = currentDiceRoll3+currentDiceRoll4;
    if (blue_score > red_score){
      win = "blue";
    }
    else if (red_score > blue_score){
      win = "red";
    }
    else{
      win="tie";
    }
    _showMyDialog(win);
  }
  
Future<void> _showMyDialog(win) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Dice Fight'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('The winner is'),
              Text(win),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
  
  
  @override
  Widget build(context) {
    return Row(
          children: <Widget>[
            const SizedBox(width: 150),
            Column(mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Player Blue",
                  style: TextStyle(color: Colors.white, fontSize: 32)),
                Image.asset(
                  'assets/images/dice-$currentDiceRoll.png',
                  width: 200,
                ),
              
                Image.asset(
                  'assets/images/dice-$currentDiceRoll2.png',
                  width: 200,
                ),
                const SizedBox(height: 20),
                TextButton(
                    // onPressed: () {}),
                    onPressed: rollDice1,
                    style: TextButton.styleFrom(
                      // padding: const EdgeInsets.only(top: 20,),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    child: const Text(
                      'Roll Dice',
                      style: TextStyle(color: Colors.white),
                    ))],

                    ),
              const SizedBox(width: 700),
              Column(mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                  "Player Red",
                  style: TextStyle(color: Colors.white, fontSize: 32)),
                  Image.asset(
                    'assets/images/dice-$currentDiceRoll3.png',
                    width: 200,
                  ),
                
                  Image.asset(
                    'assets/images/dice-$currentDiceRoll4.png',
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                      // onPressed: () {}),
                      onPressed:() {winner();},
                      style: TextButton.styleFrom(
                        // padding: const EdgeInsets.only(top: 20,),
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                      child: const Text(
                        'Roll Dice',
                        style: TextStyle(color: Colors.white),
                      ))],
                      
                      )

          ]
          
        );
        
  }
}