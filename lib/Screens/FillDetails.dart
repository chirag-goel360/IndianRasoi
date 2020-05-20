import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:percent_indicator/percent_indicator.dart';

class fillDetails extends StatefulWidget {
  @override
  _fillDetailsState createState() => _fillDetailsState();
}

class _fillDetailsState extends State<fillDetails> {
  Widget chips(String label,Color color)
  {
    return Container(
      child: Chip(
        label: Text(label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        ),
        backgroundColor: color,
        elevation: 4,
        shadowColor: Colors.grey[50],
        padding: EdgeInsets.all(4),
      ),
      margin: EdgeInsets.only(left: 12,right: 12,top: 2,bottom: 2),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:FlutterGradient.cloudyApple(),
      ),
      child: Column(
        children: <Widget>[
          Center(child: Text('Nutrition',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
            ),
          )
          ),
          SizedBox(height: 10),
          Container(
            child: Row(
              //Variable percent to be written for calories, protein, carb, fat
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 80.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8,
                  percent: 0.8,
                  center: Text('Calories',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.redAccent,
                ),
                Padding(padding: EdgeInsets.only(left: 10),),
                CircularPercentIndicator(
                  radius: 80.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8,
                  percent: 0.5,
                  center: Text('Protein',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.deepPurpleAccent,
                ),
                Padding(padding: EdgeInsets.only(left: 10),),
                //Variable Change Indicators to be written
                CircularPercentIndicator(
                  radius: 80.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8,
                  percent: 0.5,
                  center: Text('Carb',
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.greenAccent,
                ),
                Padding(padding: EdgeInsets.only(left: 10),),
                CircularPercentIndicator(
                  radius: 80.0,
                  animation: true,
                  animationDuration: 1200,
                  lineWidth: 8,
                  percent: 0.2,
                  center: Text('Fat',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.white,
                  progressColor: Colors.purpleAccent,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Center(child: Text('Ingredients',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          )
          ),
          Wrap(
            //Variable ingredients to be written
            children: <Widget>[
              chips('Sugar',Colors.green),
              chips('Egg',Colors.green),
              chips('Flour',Colors.green),
              chips('Water',Colors.green),
            ],
          ),
          Center(child: Text('Steps',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          )
          ),
          //Variable Length for the cards
          for(int i=0;i<8;i++)
          Container(
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white70,
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          child: Text('i.'),
                        ),
                        title: Text('Heart',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                        subtitle: Text ('djknkvfdj nbglfksbnf sfnjvsvkfjvkjf fkjssnnskjf vsdhiuisidhv shshdbhsbvj djshsjdbj sdfhjfjf dshjdgbjd',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
