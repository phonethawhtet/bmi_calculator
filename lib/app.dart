import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'textStyle.dart';
import 'widgets/card.dart';
import 'screens/result_screen.dart';
import './bmi_advices.dart';

enum Gender { male, female }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Gender _selectedGender = Gender.male;
  late double _BMI;
  late String _BMIStatus;
  late Color _BMIStatusColor;
  late List<String> _BMITypeAdvices;

  final weightController = TextEditingController();
  final ageController = TextEditingController();

  int _feet = 5;
  int _inch = 4;

  calculateBMI() {
    if (weightController.text.isEmpty || ageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Weight and Age cannot be empty'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      double height = (_feet.toDouble() * 12) + _inch.toDouble();
      double weight = double.parse(weightController.text);
      double age = double.parse(ageController.text);
      _BMI = weight / (height * height) * 703;

      if (_BMI < 18.5) {
        _BMIStatus = 'Underweight (Unhealthy)';
        _BMIStatusColor = Colors.yellow;
        _BMITypeAdvices = BMIAdvices[BMIType.underweight]!;
      } else if (_BMI >= 18.5 && _BMI < 25) {
        _BMIStatus = 'Normal (Healthy)';
        _BMIStatusColor = Colors.green;
        _BMITypeAdvices = BMIAdvices[BMIType.normal]!;
      } else if (_BMI >= 25 && _BMI < 30) {
        _BMIStatus = 'Overweight (At risk)';
        _BMIStatusColor = Colors.orange;
        _BMITypeAdvices = BMIAdvices[BMIType.overweight]!;
      } else {
        _BMIStatus = 'Obese (Severely obese)';
        _BMIStatusColor = Colors.red;
        _BMITypeAdvices = BMIAdvices[BMIType.obese]!;
      }

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            bmi: _BMI,
            status: _BMIStatus,
            statusColor: _BMIStatusColor,
            advices: _BMITypeAdvices,
          ),
        ),
      );
    }
  }

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
                buildTitle(),
                const SizedBox(height: 20),
                buildGender(),
                const SizedBox(height: 20),
                buildHeight(),
                const SizedBox(height: 20),
                buildWeightAndAge(),
                const SizedBox(height: 20),
                calculateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget calculateButton() {
    return ElevatedButton(
      onPressed: calculateBMI,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      child: Text(
        'Calculate',
        style: GoogleFonts.lato(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Row buildWeightAndAge() {
    return Row(
      children: [
        Expanded(
          child: CustomCard(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Weight (lbs)', style: customTextStyle()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    controller: weightController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(hintText: 'Your Weight'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: CustomCard(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Age', style: customTextStyle()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: TextField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Your Age'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  CustomCard buildHeight() {
    return CustomCard(
      height: 220,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Height (inch)',
            style: customTextStyle(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                child: NumberPicker(
                  value: _feet,
                  minValue: 1,
                  maxValue: 10,
                  onChanged: (value) => setState(() => _feet = value),
                ),
              ),
              Text(
                'feet',
                style: customTextStyle(),
              ),
              SizedBox(
                width: 80,
                child: NumberPicker(
                  value: _inch,
                  minValue: 1,
                  maxValue: 12,
                  onChanged: (value) => setState(() => _inch = value),
                ),
              ),
              Text(
                'inches',
                style: customTextStyle(),
              ),
            ],
          ),
          Text(
            '$_feet feet $_inch inches (${_feet * 30.48 + _inch * 2.54} cm)',
            style: customTextStyle(),
          ),
        ],
      ),
    );
  }

  Text buildTitle() {
    return Text(
      'BMI Calculator',
      style: customTextStyle(fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  Row buildGender() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = Gender.male;
              });
            },
            child: CustomCard(
              height: 122,
              selectedColor:
                  _selectedGender == Gender.male ? Colors.blue : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Male", style: customTextStyle()),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/male.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedGender = Gender.female;
              });
            },
            child: CustomCard(
              height: 122,
              selectedColor:
                  _selectedGender == Gender.female ? Colors.blue : Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Female", style: customTextStyle()),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      'assets/images/female.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
