import 'package:flutter/material.dart';

import 'package:bmi_calculator/textStyle.dart';
import 'package:bmi_calculator/widgets/card.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;
  final String status;
  final Color statusColor;
  final List<String> advices;

  const ResultScreen({
    Key? key,
    required this.bmi,
    required this.status,
    required this.statusColor,
    required this.advices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'BMI Calculator',
                  style: customTextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                CustomCard(
                  height: 650,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: Image.asset('assets/images/result.png'),
                      ),
                      Text(
                        'Your BMI is ',
                        style: customTextStyle(bold: true),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: customTextStyle(
                          fontSize: 50,
                          bold: true,
                          color: statusColor,
                        ),
                      ),
                      Text(
                        status,
                        style: customTextStyle(
                          fontSize: 25,
                          bold: true,
                          color: statusColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildAdvices(),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Go Back',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildAdvices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: advices
          .map(
            (advice) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                advice,
                textAlign: TextAlign.left,
                style: customTextStyle(
                  bold: true,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
