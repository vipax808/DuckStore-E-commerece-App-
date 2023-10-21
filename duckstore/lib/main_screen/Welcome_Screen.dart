import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:duckstore/main_screen/supplier_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const AnimatedColor = [
  Colors.yellowAccent,
  Colors.red,
  Colors.blueAccent,
  Colors.green,
  Colors.purple,
  Colors.teal
];
const TextStyleAni = TextStyle(
  fontSize: 45,
  fontWeight: FontWeight.bold,
  fontFamily: 'Acme',
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool processing = false;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/inapp/bgimage.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text(
              //   'WELCOME',
              //   style: TextStyle(color: Colors.white, fontSize: 30),
              // ),
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText('Welcome',
                      textStyle: TextStyleAni, colors: AnimatedColor),
                  ColorizeAnimatedText('DuckStore',
                      textStyle: TextStyleAni, colors: AnimatedColor),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
              SizedBox(
                height: 120,
                width: 200,
                child: Image(
                  image: AssetImage('assets/images/inapp/logo.jpg'),
                ),
              ),
              // Text(
              //   'SHOP',
              //   style: TextStyle(color: Colors.white, fontSize: 30),
              // ),

              SizedBox(
                height: 80,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                    fontFamily: 'Acme',
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText('Buy'),
                      RotateAnimatedText('Shop'),
                      RotateAnimatedText('Duck Store'),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Suppliers only',
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 26,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedLogo(controller: _controller),
                        YellowButton(
                            label: 'Log In',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'SupplierScreen');
                            },
                            width: 0.25),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: YellowButton(
                              label: 'Sign Up', onPressed: () {}, width: 0.25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: YellowButton(
                              label: 'Log In',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'AuthLogin');
                              },
                              width: 0.25),
                        ),
                        YellowButton(
                            label: 'Sign Up',
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'AuthSignUp');
                            },
                            width: 0.25),
                        AnimatedLogo(controller: _controller),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38.withOpacity(0.4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GoogleFacebookLogin(
                        label: 'Google',
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('assets/images/inapp/google.jpg'),
                        ),
                      ),
                      GoogleFacebookLogin(
                        label: 'Facebook',
                        onPressed: () {},
                        child: Image(
                          image: AssetImage('assets/images/inapp/facebook.jpg'),
                        ),
                      ),
                      processing == true
                          ? CircularProgressIndicator()
                          : GoogleFacebookLogin(
                              label: 'Guest',
                              onPressed: () async {
                                await FirebaseAuth.instance.signInAnonymously();
                                Navigator.pushReplacementNamed(
                                    context, 'CustomerHomeScreen');
                              },
                              child: Icon(
                                Icons.person,
                                size: 55,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required AnimationController controller,
  }) : _controller = controller;

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * pi,
          child: child,
        );
      },
      child: Image(
        image: AssetImage('assets/images/inapp/logo.jpg'),
      ),
    );
  }
}

class YellowButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final double width;

  YellowButton({
    required this.label,
    required this.onPressed,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.black),
      ),
      style: ElevatedButton.styleFrom(
        primary: Colors.yellow,
        minimumSize: Size(MediaQuery.of(context).size.width * width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

class GoogleFacebookLogin extends StatelessWidget {
  final String label;
  final Function() onPressed;
  final Widget child;

  GoogleFacebookLogin({
    required this.label,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            SizedBox(height: 50, width: 50, child: child),
            Text(
              label,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
