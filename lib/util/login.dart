import 'package:flutter/material.dart';
import 'package:asweomelogin/util/widgets.dart';
import 'package:asweomelogin/util/theme.dart' as Theme;
import 'package:flutter/services.dart';

class MyLogin extends StatefulWidget {
  final ValueNotifier<double> notifier;

  const MyLogin({Key key, this.notifier}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}



@override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }




    
class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height
                : 775.0,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Theme.MyColors.gradientStart,
                        Theme.MyColors.gradientEnd
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.mirror),
                ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 75.0),
              child: new Image(
                  width: 250.0,
                  height: 250.0,
                  fit: BoxFit.fill,
                  image: new AssetImage('assets/logo.png'),
                ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: MenuBar(),
            ),
            Expanded(
              flex: 2,
              child: PageView(
                controller: pageController,
                onPageChanged: (pageid){
                    if (pageid == 0) {
                        setState(() {
                          isnew =false;
                          exist = true; 
                        });
                        }
                        else{
                          setState(() {
                            isnew = true;
                          exist = false;
                          });
                        }
                },
                children: <Widget>[
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: BuildSignIn(),
                          ),
                          new ConstrainedBox(
                            constraints: const BoxConstraints.expand(),
                            child: BuildSignUp(),
                          ),
                        ],
              ),
            ),
        ],
        ),
      ),
    );
  }
}