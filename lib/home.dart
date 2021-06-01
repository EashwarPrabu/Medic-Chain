import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_me/addpatient.dart';

class Home extends StatefulWidget {
  @override
  Homestate createState() => Homestate();
}

class Homestate extends State<Home> {
  String hex = "d1d9d9";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title:Text("DUMMY"),
      ),*/

      body: Container(
        child: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            color: Colors.white70,
            child: Column(
              children: [
                SizedBox(height: 30),
                Image(
                    image: AssetImage('assets/doc.jpeg'),
                    width: 500,
                    height: 500),
                SizedBox(height: 15),
                Text(
                  'Medic Chain',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'A Block Chain based app that securely stores your Medical Records!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 70,
            width: 300,
            child: InkWell(
              splashColor: Colors.cyanAccent,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    primary: Color(int.parse("0xff00adb5")), // background
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                    ) // foreground
                    ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Addpatient(),
                      ));
                },
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
