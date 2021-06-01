import 'package:flutter/material.dart';
import 'package:sms_me/blockchain.dart';

import 'appbar.dart';
import 'dialogbox.dart';
import 'drawer.dart';

class Medicine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Medicinepage());
  }
}

class Medicinepage extends StatefulWidget {
  @override
  _MedicinepageState createState() => _MedicinepageState();
}

class _MedicinepageState extends State<Medicinepage> {
  final _addMedicineFormkey = GlobalKey<FormState>();
  String patientid, medicinename, dosage;
  bool agreedToTerms = false;
  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();
  BlockChain blockChain = BlockChain();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: pulldrawer(context, 3),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Medicine",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Form(
        key: _addMedicineFormkey,
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Center(
                    child: Text(
                  "MEDICINE UPDATE",
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
                      return "Enter Patient's id.";
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Patient ID",
                    prefixIcon: Icon(Icons.account_circle_rounded),
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
                    if (value.isEmpty) return "Medicine Name can't be empty";
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Medicine Name",
                    prefixIcon: Icon(Icons.medical_services_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    medicinename = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                //3
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return "Dosage can't be empty";
                  },
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Dosage",
                    prefixIcon: Icon(Icons.colorize_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (value) {
                    dosage = value;
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                // 4

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
                            _addMedicineFormkey.currentState.reset();
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
                            if (!_addMedicineFormkey.currentState.validate()) {
                            } else {
                              blockChain.setMedicine(
                                  patientid, medicinename, dosage);
                              dialogBox(
                                  "Medicine details added successfully",
                                  false,
                                  (_width / 100) * 75,
                                  (_width / 100) * 75,
                                  2,
                                  context,
                                  "Done");
                            }
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
