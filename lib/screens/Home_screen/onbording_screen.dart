import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: const [
              onBordingPage(image: 'hi', title: 'hi',subtitle: 'hsms',),
              onBordingPage(image: 'hi', title: 'hi',subtitle: 'hsms',),
              onBordingPage(image: 'hi', title: 'hi',subtitle: 'hsms',),
            ],
          ),

          Positioned(
              top: 750,
              child: TextButton(onPressed: (){}, child: const Text('Skip')))



        ],
      ),


    );
  }
}

class onBordingPage extends StatelessWidget {
  const onBordingPage({
    super.key, required this.image, required this.title, required this.subtitle,
  });

  final String image,title,subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15),
      child: Column(
        children: [
          Image(image: AssetImage('assets/home_page.jpg'),
          width:double.infinity,
          ),
          Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center),
              const SizedBox(height: 400,),
          Text('HOUSING SOCIETY MANAGEMENT SYSTEM',style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center)

        ],
      ),
    );
  }
}
