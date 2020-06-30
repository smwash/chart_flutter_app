import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flush_chart/components/rounded_button.dart';
import 'package:flush_chart/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation =
        ColorTween(begin: Colors.white, end: Colors.grey).animate(controller);
    controller.reverse(from: 1.0);

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                height: 280.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('images/Illustration 02.png'),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'chat logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                  ),
                  TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RoundedButton(
                      label: 'Log In',
                      color: Colors.lightBlueAccent,
                      onPress: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                    ),
                    RoundedButton(
                      label: 'Register',
                      color: Colors.blueAccent,
                      onPress: () {
                        Navigator.pushNamed(context, RegistrationScreen.id);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
