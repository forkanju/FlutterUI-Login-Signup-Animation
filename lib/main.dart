import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_up.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform(
                transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                child: Container(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'Hello',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 180.0, 0.0, 0.0),
                        child: Text(
                          'There',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(220.0, 170.0, 0.0, 0.0),
                        child: Text(
                          '.',
                          style: TextStyle(
                              fontSize: 120.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontFamily: 'Josefinsans'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform(
                transform: Matrix4.translationValues(delayedAnimation.value*width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            // focusedBorder: OutlineInputBorder(
                            //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            //   borderSide: BorderSide(color: Colors.blue),
                            // ),
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(
                          top: 15.0,
                          left: 20.0,
                        ),
                        child: InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(
                        height: 45.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(25.0),
                          shadowColor: Colors.greenAccent,
                          color: Colors.green,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        height: 45.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0,
                              ),
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(25.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: ImageIcon(
                                  AssetImage('assets/images/facebook.png'),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Center(
                                child: Text(
                                  'Log in with Facebook.',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Transform(
                transform: Matrix4.translationValues(muchDelayedAnimation.value*width, 0.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New to Spotify ?',
                      style: TextStyle(fontFamily: 'Montserrat'),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
