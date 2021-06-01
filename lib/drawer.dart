import 'package:flutter/material.dart';
import 'package:sms_me/addpatient.dart';
import 'package:sms_me/medicine.dart';
import 'package:sms_me/patientsdetails.dart';
import 'package:sms_me/progress.dart';
import 'package:sms_me/result.dart';

//import 'ScanQR.dart';

Widget pulldrawer(BuildContext context, int option) {
  String hex = "00adb5";
  Color mainColor = Color(int.parse("0xff${hex}"));
  hex = "8fd9a8";
  Color subColor = Color(int.parse("0xff${hex}"));
  return Drawer(
    child: ListView(
      children: <Widget>[
        //1
        Container(
          child: DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [mainColor, const Color(0xff18ffff)],
                tileMode: TileMode.repeated,
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(5, 45, 5, 3),
              child: Column(
                children: [
                  Text(
                    "Welcome to Medic Chain!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "App that securely stores your medical records! ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //2
        ListTile(
          leading: Icon(Icons.person_add_sharp, color: Colors.black),
          title: Text("Add new Patient",
              style: TextStyle(
                  color: (option == 2) ? mainColor : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI')),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addpatient()));
          },
        ),

        //3
        ListTile(
          leading: Icon(Icons.paste_sharp, color: Colors.black),
          title: Text("Patient's Medicine Update",
              style: TextStyle(
                  color: (option == 3) ? mainColor : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI')),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Medicine()));
          },
        ),

        //4
        ListTile(
          leading: Icon(
            Icons.bar_chart_sharp,
            color: Colors.black,
          ),
          title: Text("Patient's Progress",
              style: TextStyle(
                  color: (option == 4) ? mainColor : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI')),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Progress()));
          },
        ),

        //5
        ListTile(
          leading: Icon(Icons.chat_rounded, color: Colors.black),
          title: Text("View Patient's Details",
              style: TextStyle(
                  color: (option == 5) ? mainColor : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Segoe UI')),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Patientsdetails()));
          },
        ),
      ],
    ),
  );
}
