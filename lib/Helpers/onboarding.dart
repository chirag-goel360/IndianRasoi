import 'package:flutter/material.dart';
import 'package:flutter_gradients/flutter_gradients.dart';
import 'package:indiarasoi/Helpers/onboardingdata.dart';

class IntroScreen extends StatefulWidget {
  final List<OnbordingData> onbordingDataList;
  final MaterialPageRoute pageRoute;
  IntroScreen(this.onbordingDataList, this.pageRoute);

  void skipPage(BuildContext context) {
    Navigator.pushReplacement(context, pageRoute);
  }

  @override
  IntroScreenState createState() {
    return new IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == widget.onbordingDataList.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(gradient: FlutterGradient.cleanMirror()),
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Expanded(
              flex: 5,
              child: new PageView(
                physics: BouncingScrollPhysics(),
                children: widget.onbordingDataList,
                controller: controller,
                onPageChanged: _onPageChanged,
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  new FlatButton(
                    child: new Text(lastPage ? "" : "SKIP",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage
                        ? null
                        : widget.skipPage(
                      context,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      child: Row(
                        children: [
                          _buildPageIndicator(0),
                          _buildPageIndicator(1),
                          _buildPageIndicator(2),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    child: new Text(lastPage ? "GOT IT" : "NEXT",
                        style: new TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0)),
                    onPressed: () => lastPage
                        ? widget.skipPage(context)
                        : controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn),
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
