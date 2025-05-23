import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tasks',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
        backgroundColor: const Color.fromARGB(255, 97, 170, 207),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Dice Rolling App'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiceRollingApp()),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Tabbed Info App'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabbedInfoApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// dice rolling app
class DiceRollingApp extends StatefulWidget {
  @override
  _DiceRollingAppState createState() => _DiceRollingAppState();
}

class _DiceRollingAppState extends State<DiceRollingApp> {
  int _diceNumber = 1;

  void _rollDice() {
    setState(() {
      _diceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    String diceImagePath = 'images/dice_$_diceNumber.png';

    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
        backgroundColor: const Color.fromARGB(255, 221, 46, 46),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(diceImagePath, height: 150),
              SizedBox(height: 20),
              ElevatedButton(child: Text('Roll Dice'), onPressed: _rollDice),
            ],
          ),
        ),
      ),
    );
  }
}

// Task 2: Tabbed Info App
class TabbedInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 25, 178, 142),
          title: Text('About Me'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'Intro'),
              Tab(icon: Icon(Icons.school), text: 'Education'),
              Tab(icon: Icon(Icons.favorite), text: 'Hobbies'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // introduction
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello!\n\n',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            "I'm Amber Ali Shah, an BSCS 6 semester student passionate about tech,and coding.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // education
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Education:\n\n',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '• A Levels: Computer Science, Mathematics, Physics\n'
                            '• O Levels: Pre-Engineering',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),

            // hobbies
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hobbies:\n\n',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '• Gym & Fitness\n'
                            '• Tech inthusiast\n'
                            '• Exploring Business Ideas\n'
                            '• Pro Biker',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
