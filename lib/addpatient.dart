import 'package:flutter/material.dart';
import 'package:sms_me/appbar.dart';
import 'package:sms_me/drawer.dart';
import 'package:sms_me/medicine.dart';
import 'package:sms_me/patientsdetails.dart';
import 'package:sms_me/progress.dart';

import 'blockchain.dart';
import 'dialogbox.dart';

class Addpatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Addpatientpage(),
    );
  }
}

class Addpatientpage extends StatefulWidget {
  @override
  _AddpatientpageState createState() => _AddpatientpageState();
}

class _AddpatientpageState extends State<Addpatientpage> {
  final _addPatientFormkey = GlobalKey<FormState>();
  String patientid, name, age, gender;
  bool agreedToTerms = false;
  int id = -1;
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  BlockChain blockChain = BlockChain();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: pulldrawer(context, 2),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Patient",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Form(
        key: _addPatientFormkey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Center(
                    child: Text(
                  "ADD NEW PATIENT",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
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
                      return "Patient id is a required field.";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    filled: true,
                    labelText: "Patient ID",
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
                // 2
                TextFormField(
                  validator: (value) {
                    Pattern pattern = r'^[ A-Za-z]+(?:[ _-][A-Za-z]+)*$';
                    RegExp regex = new RegExp(pattern);
                    if (value.isEmpty)
                      return " Name can't be empty";
                    else if (!regex.hasMatch(value)) return 'Invalid  Name';
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    filled: true,
                    //hintText: 'i.e. a person, place or thing',
                    labelText: "Patient Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                //3
                TextFormField(
                  validator: (value) {
                    Pattern pattern = r'^[0-9]+(\.[0-9][0-9]?)?$';
                    RegExp regex = new RegExp(pattern);
                    if (value.isEmpty)
                      return " Age can't be empty";
                    else if (!regex.hasMatch(value)) return 'Invalid  Age';
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    prefixIcon: Icon(Icons.accessibility_new),
                    labelText: "Patient Age",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    age = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                // 4
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Text(
                        'Gender :',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 30),
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (value) {
                          setState(() {
                            gender = "male";
                            id = 1;
                          });
                        },
                      ),
                      Text("Male"),
                      SizedBox(width: 50),
                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (value) {
                          setState(() {
                            gender = "female";
                            id = 2;
                          });
                        },
                      ),
                      Text("Female"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                //5
                FormField(
                  initialValue: false,
                  validator: (value) {
                    if (value == false) {
                      return 'You must agree to the terms of service.';
                    }
                    return null;
                  },
                  builder: (FormFieldState formFieldState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: agreedToTerms,
                              onChanged: (value) {
                                // When the value of the checkbox changes,
                                // update the FormFieldState so the form is
                                // re-validated.
                                formFieldState.didChange(value);
                                setState(() {
                                  agreedToTerms = value;
                                });
                              },
                            ),
                            Text(
                              'I agree that the above details are true.',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        if (!formFieldState.isValid)
                          Text(
                            formFieldState.errorText ?? "",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Theme.of(context).errorColor,
                                fontSize: 16),
                          ),
                      ],
                    );
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
                            _addPatientFormkey.currentState.reset();
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
                          onPressed: () {
                            if (!_addPatientFormkey.currentState.validate()) {
                            } else {
                              print("\n" +
                                  patientid +
                                  "\n" +
                                  name +
                                  "\n" +
                                  age); //+"\n"+age);
                              blockChain.setPatientDetails(
                                  patientid, name, age, gender);
                              dialogBox(
                                  "Patient's details added successfully",
                                  false,
                                  (_width / 100) * 75,
                                  (_width / 100) * 75,
                                  2,
                                  context,
                                  "Done");
                            }
                          },
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
    );
  }
}
