import 'package:flutter/material.dart';
import 'package:social_media_widgets/instagram_story_swipe.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurpleAccent,
        child: Center(
          child: Text(
            'Yellow',
            style: TextStyle(
              fontSize: 20,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ),
    );
  }
}

class OurStories extends StatefulWidget {
  @override
  _OurStoriesState createState() => _OurStoriesState();
}

class _OurStoriesState extends State<OurStories> {
  _onClickStories() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InstagramStorySwipe(
          children: <Widget>[
            Screen(),
            Screen(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'This week Stories',
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                onPressed: _onClickStories,
                child: Text(
                  'Story Swipe',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
