import 'package:flutter/material.dart';
import 'package:sms_me/addpatient.dart';
import 'package:sms_me/home.dart';

import 'appbar.dart';
import 'drawer.dart';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 5),
      () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: pulldrawer(context, 2),
      appBar: AppBar(title: Text("MedicChain")),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              //d1d9d9
              color: Color(int.parse("0xfff4f9f9")),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 100.0,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      foregroundImage: AssetImage('assets/heartbeat.gif'),
                      radius: 200.0,
//                      backgroundColor: Color(int.parse("0xffd1d9d9")),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
