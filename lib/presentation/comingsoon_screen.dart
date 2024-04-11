import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:LayoutBuilder(
        builder: (context,constraints) {
          final width = constraints.maxWidth;
          var fontSize = 50.0;
          var imgsize=width/3;
          if (width <= 480) {
            imgsize=width/2;
            fontSize = 25.0;
          }else if(width <= 680){
            fontSize = 42.0;
            imgsize=width/2.5;
          }else if(width <= 580){
            fontSize = 32.0;
            imgsize=width/2.2;
            }else if(width <=380){
            fontSize = 16.0;
            imgsize=width/2;
          } else {
            fontSize = 50.0;
            imgsize=width/3;
          }
          return Center(
            child: Column(
              children: [
                Image.asset("assets/comingSoon.jpg",width: imgsize),
                DefaultTextStyle(
                  style: TextStyle(fontSize: fontSize,color: const Color.fromARGB(221, 13, 13, 13)),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('COMING SOON'),
                    ],
                    isRepeatingAnimation: true,
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                )
              ]
              ,
            ),
          );
        }
      )
    );
  }
}