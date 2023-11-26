import 'package:flutter/material.dart';

class SplashScrren extends StatelessWidget {
  const SplashScrren({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
        Navigator.pushReplacementNamed(context, '/main');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/music.png',
              width: 180,
              height: 180,
            ),
            Container(
                margin: EdgeInsets.all(40),
                child: Text(
              'MELODIFY',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ))
          ],
        ),
      ),
    );
  }
}
