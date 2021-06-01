import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_me/customcard.dart';

class result extends StatefulWidget {
  dynamic detail;
  result({this.detail});
  @override
  resultstate createState() => resultstate();
}

class resultstate extends State<result> {
  dynamic details;
  @override
  void initState() {
    super.initState();
    details = widget.detail;
    print("FROM INIT FN: ");
    print(details);
  }

  @override
  Widget build(BuildContext context) {
    String hex = "00adb5";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Result"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            ClipOval(
              child: Material(
                color: Color(int.parse("0xff${hex}")),
                child: InkWell(
                  splashColor: Colors.lightBlueAccent[600], // inkwell color
                  child: SizedBox(
                    width: 64,
                    height: 64,
                    child: Icon(
                      details[2] == "Male" ? Icons.male : Icons.female,
                      size: 30,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Name: " + details[0],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Age: " + details[1],
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Medical Records',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: details[3].length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        CustomCard(
                          description: details[4][index][0],
                          medicine: details[3][index][0],
                          dosage: details[3][index][1],
                          date: details[4][index][1],
                        )
                      ]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
