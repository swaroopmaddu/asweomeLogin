import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:asweomelogin/util/theme.dart' as Theme;



Color active = Colors.white;
Color inactive = Colors.black;

PageController pageController = PageController();


bool isnew = false;

bool _obscureTextLogin = true;
bool _obscureTextSignup = true;

class MenuBar extends StatefulWidget {
  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: prefix0.EdgeInsets.symmetric(horizontal: 5.0),
      width: MediaQuery.of(context).size.width/1.5,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              color: isnew ? Colors.transparent : Colors.white,
              onPressed: (){
                  setState(() {
                    isnew = !isnew;
                  });
                  pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeOut);
              },
              child: Text(
                "Existing",
                style: TextStyle(
                    color: isnew ? active :inactive,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    fontFamily: "Roboto"),
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color:  isnew ? Colors.white : Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
              onPressed: (){
                 setState(() {
                   isnew = !isnew;
                 });
                 pageController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeOut);
              },
              child: Text(
                "New",
                style: TextStyle(
                    color: isnew ? inactive : active,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto"),
              ),
            ),
          )
        ],
      ),
    );
  }
}


class BuildSignIn extends StatefulWidget {
  @override
  _BuildSignInState createState() => _BuildSignInState();
}

class _BuildSignInState extends State<BuildSignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 190.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          obscureText: _obscureTextLogin,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                _obscureTextLogin = !_obscureTextLogin;
                              });
                              },
                              child: Icon(
                                _obscureTextLogin
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 170.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.MyColors.gradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.MyColors.gradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        Theme.MyColors.gradientEnd,
                        Theme.MyColors.gradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.MyColors.gradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    onPressed: () =>
                        print("Login button pressed")),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white,
                      fontSize: 16.0,
                      fontFamily: "Roboto"),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white10,
                          Colors.white,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "Roboto"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white10,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 1.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  width: 100.0,
                  height: 1.0,
                ),
              ],
            ),
          ),
          buildButton(),
        ],
      ),
    );
  }
}


class BuildSignUp extends StatefulWidget {
  @override
  _BuildSignUpState createState() => _BuildSignUpState();
}

class _BuildSignUpState extends State<BuildSignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.envelope,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.userCircle,
                              color: Colors.black,
                              size: 22.0,
                            ),
                            hintText: "Username",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          obscureText: _obscureTextSignup,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureTextSignup = !_obscureTextSignup;
                                });
                              },
                              child: Icon(
                                _obscureTextSignup
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                        top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                        child: TextField(
                          obscureText: _obscureTextSignup,
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 16.0,
                              color: Colors.black),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              FontAwesomeIcons.lock,
                              size: 22.0,
                              color: Colors.black,
                            ),
                            hintText: "Retype Password",
                            hintStyle: TextStyle(
                                fontFamily: "Roboto", fontSize: 17.0),
                            suffixIcon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obscureTextSignup = !_obscureTextSignup;
                                });
                              },
                              child: Icon(
                                _obscureTextLogin
                                    ? FontAwesomeIcons.eye
                                    : FontAwesomeIcons.eyeSlash,
                                size: 15.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 340.0),
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Theme.MyColors.gradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: Theme.MyColors.gradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: new LinearGradient(
                      colors: [
                        Theme.MyColors.gradientEnd,
                        Theme.MyColors.gradientStart
                      ],
                      begin: const FractionalOffset(0.2, 0.2),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: Theme.MyColors.gradientEnd,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    onPressed: () =>
                        print("Signup button pressed")),
              ),
            ],
          ),
         
        ],
      ),
    );
  }
}

Row buildButton() {
  return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, right: 40.0),
              child: GestureDetector(
                onTap: () => print("Facebook button pressed"),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: new Icon(
                    FontAwesomeIcons.facebookF,
                    color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () => print("Google button pressed"),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: new Icon(
                    FontAwesomeIcons.google,
                    color: Color(0xFF0084ff),
                  ),
                ),
              ),
            ),
          ],
        );
}