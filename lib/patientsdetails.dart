import 'package:flutter/material.dart';
import 'package:sms_me/appbar.dart';
import 'package:sms_me/blockchain.dart';
import 'package:sms_me/dialogbox.dart';
import 'package:sms_me/result.dart';

import 'drawer.dart';

class Patientsdetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Patientsdetailspage());
  }
}

class Patientsdetailspage extends StatefulWidget {
  @override
  _PatientsdetailspageState createState() => _PatientsdetailspageState();
}

class _PatientsdetailspageState extends State<Patientsdetailspage> {
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  final _patientdetailskey = GlobalKey<FormState>();
  BlockChain blockChain = BlockChain();
  String patientid;
  bool isLoading = false;
  bool isVisible = false;
  dynamic answer;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: pulldrawer(context, 5),
      appBar: AppBar(title: Text("Patient Record")),
      body: Form(
        key: _patientdetailskey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Center(
                    child: Text(
                  "Patients Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                SizedBox(
                  height: 24,
                ),
                // 1
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Enter Patient's id";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: "Patient id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    patientid = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                //Buttons
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonTheme(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.yellow[700],
                          child: Text("Cancel"),
                          onPressed: () {
                            _patientdetailskey.currentState.reset();
                            setState(() {
                              isVisible = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 24),
                      ButtonTheme(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          color: Colors.lightBlue[700],
                          child: Text("Submit",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                              isVisible = true;
                            });
                            if (!_patientdetailskey.currentState.validate()) {
                            } else {
                              dynamic data =
                                  await blockChain.getPatientDetails(patientid);
                              if (data[0] == "") {
                                Future.delayed(Duration(seconds: 3), () {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              } else {
                                answer = data;
                                Future.delayed(Duration(seconds: 3), () {
                                  setState(() {
                                    isVisible = false;
                                  });
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          result(detail: answer),
                                    ),
                                  );
                                });
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: isVisible
                      ? Container(
//                  decoration: BoxDecoration(
//                    color: Color(int.parse("0xff00adb5")),
//                  ),
                          child: isLoading
                              ? Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Text(
                                    "No such ID found!",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        )
                      : Container(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
