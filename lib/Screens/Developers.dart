import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Developers extends StatefulWidget {
  @override
  _DevelopersState createState() => _DevelopersState();
}

class _DevelopersState extends State<Developers> {
  _launchID(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("cant launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Developers',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.teal,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: PageView(
        pageSnapping: true,
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.lightBlue,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(
                        16.0,
                        16.0,
                        16.0,
                        16.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(16.0),
                                margin: EdgeInsets.only(
                                  top: 16.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 95.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Ritik Miglani",
                                            style: Theme.of(context).textTheme.title,
                                          ),
                                          ListTile(
                                            contentPadding: EdgeInsets.all(0),
                                            title: Text(
                                              "Student",
                                            ),
                                            subtitle: Text(
                                              "Delhi",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://media-exp1.licdn.com/dms/image/C5103AQG-AVAkqSzB0Q/profile-displayphoto-shrink_400_400/0?e=1598486400&v=beta&t=fSbxa5BPnDgmLyFyCb3IWQ7WUOTvvj_TQRHsu36Q-g8',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                margin: EdgeInsets.only(
                                  left: 16.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    "Developer Information",
                                  ),
                                ),
                                Divider(),
                                ListTile(
                                  title: Text(
                                    "Email",
                                  ),
                                  subtitle: Text(
                                    "miglaniritik20@gmail.com",
                                  ),
                                  leading: Icon(
                                    Icons.email,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "Phone",
                                  ),
                                  subtitle: Text(
                                    "+91-9555437096",
                                  ),
                                  leading: Icon(
                                    Icons.phone,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "LinkedIn",
                                  ),
                                  subtitle: GestureDetector(
                                    onTap: () {
                                      _launchID(
                                        "https://www.linkedin.com/in/ritik-miglani-5b5a28148/",
                                      );
                                    },
                                    child: Text(
                                      "https://www.linkedin.com/in/ritik-miglani-5b5a28148/",
                                    ),
                                  ),
                                  leading: Icon(
                                    Icons.web,
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    "About",
                                  ),
                                  subtitle: Text(
                                    "Experienced Software Engineer with a demonstrated history of working in the computer software industry. Skilled in Firebase, Oracle Database Management, Android Development. Strong engineering professional with a Bachelor of Technology focused in Computer Science Engineering from Amity School of Engineering & Technology.",
                                  ),
                                  leading: Icon(
                                    Icons.person,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Card(
              color: Colors.deepPurpleAccent,
              elevation: 4,
              margin: EdgeInsets.all(24),
              child: Center(
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          16.0,
                          16.0,
                          16.0,
                          16.0,
                        ),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(16.0),
                                  margin: EdgeInsets.only(
                                    top: 16.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 95.0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Chirag Goel",
                                              style: Theme.of(context).textTheme.title,
                                            ),
                                            ListTile(
                                              contentPadding: EdgeInsets.all(0),
                                              title: Text(
                                                "Student",
                                              ),
                                              subtitle: Text(
                                                "Delhi",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://media-exp1.licdn.com/dms/image/C5603AQHHKaG64F47Aw/profile-displayphoto-shrink_400_400/0?e=1598486400&v=beta&t=S-KAzE6K--vKS6cn6pg_Knd9JlXR0hfzG1Iuv5X4668',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListTile(
                                    title: Text(
                                      "Developer Information",
                                    ),
                                  ),
                                  Divider(),
                                  ListTile(
                                    title: Text(
                                      "Email",
                                    ),
                                    subtitle: Text(
                                      "chirag.goel360@gmail.com",
                                    ),
                                    leading: Icon(
                                      Icons.email,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "Phone",
                                    ),
                                    subtitle: Text(
                                      "+91-9818496835",
                                    ),
                                    leading: Icon(
                                      Icons.phone,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "LinkedIn",
                                    ),
                                    subtitle: GestureDetector(
                                      onTap: () {
                                        _launchID(
                                          "https://www.linkedin.com/in/chirag-goel-06b804148/",
                                        );
                                      },
                                      child: Text(
                                        "https://www.linkedin.com/in/chirag-goel-06b804148/",
                                      ),
                                    ),
                                    leading: Icon(
                                      Icons.web,
                                    ),
                                  ),
                                  ListTile(
                                    title: Text(
                                      "About",
                                    ),
                                    subtitle: Text(
                                      "Experienced Android Developer with a demonstrated history of working in the health wellness and fitness industry. Skilled in Java, Algorithms, Flutter, Cascading Style Sheets (CSS), and C (Programming Language). Strong engineering professional with a Bachelor of Technology - BTech focused in Computer Science from Amity School of Engineering & Technology.",
                                    ),
                                    leading: Icon(
                                      Icons.person,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}