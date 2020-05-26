import 'package:flutter/material.dart';
import 'package:indiarasoi/Screens/Developers.dart';

class LoadData extends StatefulWidget {
  @override
  _LoadDataState createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
      ),
      backgroundColor: Colors.green.shade50,
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: Column(
            children: <Widget>[
              Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.greenAccent,
                  elevation: 5,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DevelopersInfo()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: 350,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://cdn.eso.org/images/thumb300y/eso1322d.jpg'),
                              fit: BoxFit.fill,
                            )
                          ),
                          child: Center(
                            child: Text('Cupkake',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
