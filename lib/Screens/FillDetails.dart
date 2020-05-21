import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:indiarasoi/Models/recipy.dart';
import 'package:percent_indicator/percent_indicator.dart';

class fillDetails extends StatefulWidget {
  final Recipy rec;
  fillDetails(this.rec);
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
                  percent: widget.rec.calories,
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
                  percent: widget.rec.protein,
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
                  percent: widget.rec.carbohydrates,
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
                  percent: widget.rec.fat,
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
              for(int i=0;i<widget.rec.ingredients.length;i++)
                chips(widget.rec.ingredients[i],Colors.green),
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

            buildItemsContent(context)
          //Variable Length for the cards
          // ListView.builder(shrinkWrap: true,itemBuilder: buildItemsContent, itemCount: widget.rec.stepsno,),
        ],
      ),
    );
  
  }

  Widget buildItemsContent(BuildContext context){
    return Container(
            child: Column(
              children: <Widget>[
                 for(int i=0;i<widget.rec.stepsno;i++)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white70,
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                     // for(int i=0;i<widget.rec.stepsno;i++)
                       ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          //Variable index, title, subtitle to be written
                          child:  Text((i+1).toString()),
                        ),
                        title: Text('Step No.'+ (i+1).toString(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                        subtitle: Text (widget.rec.steps[i],
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
