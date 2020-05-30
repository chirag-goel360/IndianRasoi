import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:indiarasoi/Screens/Login.dart';
import 'package:indiarasoi/Services/sign_in.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class signPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black26,
            height: 1900,
            child: RotatedBox(
              quarterTurns: 3,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.deepPurple, Colors.deepPurple.shade200],
                    [Colors.indigo.shade200, Colors.purple.shade200],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 600,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Container(
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Sign Up with Indian Rasoi",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0),)
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,color: Colors.teal,),
                            hintText: "Email Address",
                            hintStyle: TextStyle(
                                color: Colors.black54
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 16)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0))
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Colors.teal,),
                            hintText: "Password",
                            hintStyle: TextStyle(
                                color: Colors.black54
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open, color: Colors.teal,),
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                                color: Colors.black54
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.pink.shade600,
                        onPressed: (){

                        },
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(40.0))
                        ),
                        child: Text("SignUp",style: TextStyle(
                            color: Colors.white70
                        ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("or, connect with",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                      ),),
                    SizedBox(height: 15.0,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [Color(0xff3b5998),Colors.blueAccent],
                                tileMode: TileMode.clamp
                              ),
                            ),
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              onPressed: (){

                              },
                              child: Icon(
                                FontAwesomeIcons.facebookF,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [Colors.lightBlueAccent,Colors.lightBlue.shade900],
                                  tileMode: TileMode.clamp
                              ),
                            ),
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              onPressed: (){

                              },
                              child: Icon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [Colors.red.shade300,Colors.red.shade900],
                                  tileMode: TileMode.clamp
                              ),
                            ),
                            child: RawMaterialButton(
                              shape: CircleBorder(),
                              onPressed: (){
                                signInwithGoogle().whenComplete((){
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context){
                                            //Open Chat Page here
                                            return LoginPage();
                                          }
                                      )
                                  );
                                });
                              },
                              child: Icon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                        ),),
                        FlatButton(
                          child: Text(
                              "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900
                            ),
                          ),
                          textColor: Colors.indigo,
                          onPressed: (){

                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}