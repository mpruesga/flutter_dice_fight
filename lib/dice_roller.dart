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

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1; // Value between 1 and 6
      currentDiceRoll2 = randomizer.nextInt(6) + 1; // Value between 1 and 6
      currentDiceRoll3 = randomizer.nextInt(6) + 1; // Value between 1 and 6
      currentDiceRoll4 = randomizer.nextInt(6) + 1; // Value between 1 and 6
    });
    // print('Changing image...');
  }
  
  @override
  Widget build(context) {
    return Row(
          children: <Widget>[
            Column(mainAxisSize: MainAxisSize.min,
              children: [
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
                    onPressed: rollDice,
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
              Column(mainAxisSize: MainAxisSize.min,
                children: [
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
                      onPressed: rollDice,
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