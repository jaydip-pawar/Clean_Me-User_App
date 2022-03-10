import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clean_me/screens/home/sub_screens/SettingPage.dart';
import 'package:clean_me/screens/home/sub_screens/SharePage.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("App Dropdown Menu"),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                  textTheme: TextTheme().apply(bodyColor: Colors.lightGreenAccent),
                  dividerColor: Colors.green,
                  iconTheme: IconThemeData(color: Colors.green)),
              child: PopupMenuButton<int>(
                color: Colors.green,
                itemBuilder: (context) => [
                  PopupMenuItem<int>(value: 0, child: Text("Setting")),
                  PopupMenuItem<int>(
                      value: 1, child: Text("Help Guide")),
                  PopupMenuDivider(),
                  PopupMenuItem<int>(
                      value: 2,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.share,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("Share")
                        ],
                      )),
                ],
                onSelected: (item) => SelectedItem(context, item),
              ),
            ),
          ],
        ),
        body: Container(),
    );
  }

  void SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingPage()));
        break;
      case 1:
        print("Help Guide");
        break;
      case 2:
        print("Share Page");
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => SharePage()),
                (route) => false);
        break;
    }
  }
}