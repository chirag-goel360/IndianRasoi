import 'package:flutter/material.dart';
import 'package:indiarasoi/Screens/RecipyInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
<<<<<<< HEAD
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

=======
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipyInfo(),
    );
  }
}
>>>>>>> b4bbcf881cf4e5b448bb87f4f797fc564f205e61
