import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String description;
  final String medicine;
  final String dosage;
  final String date;

  CustomCard({this.description, this.medicine, this.dosage, this.date});

  @override
  Widget build(BuildContext context) {
    String hex = "8fd9a8";
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Color(int.parse("0xff${hex}")),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey[400],
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(2.0, 2.0),
          )
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Container(
        margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              medicine,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 18),
            Row(
              children: [
                Icon(
                  Icons.sticky_note_2_outlined,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  dosage,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 100),
                Icon(
                  Icons.today_rounded,
                  size: 30,
                ),
                SizedBox(width: 8),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
