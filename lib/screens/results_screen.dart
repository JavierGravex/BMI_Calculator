import 'package:flutter/material.dart';
import 'select_metric_screen.dart';
import 'package:final_proj/utils/tools.dart';

class ResultsScreen extends StatefulWidget {
  final String metric;
  final double? height;
  final double? weight;
  final String? gender;

  const ResultsScreen({
    super.key,
    required this.metric,
    required this.height,
    required this.weight,
    required this.gender,
  });

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  double? bmi;
  String? category;

  @override
  void initState() {
    super.initState();
    calculateBMI();
  }

  void calculateBMI() {
    if (widget.height == null || widget.weight == null) return;

    if (widget.metric == "Imperial") {
      bmi = Bmi_Tools.imperial_BMI(widget.weight!, widget.height!);
    } else {
      double heightMeters = widget.height! / 100;
      bmi = Bmi_Tools.metric_BMI(widget.weight!, heightMeters);
    }

    bmi = double.parse(bmi!.toStringAsFixed(1));
    category = Bmi_Tools.bmiCategory(bmi!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFAC9846),
      
      appBar: AppBar(
        backgroundColor: const Color(0xFFAC9846),
        elevation: 0,
        leading: IconButton(
          key: const Key('backButton'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xFFFFF3C6),
          ),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your BMI is:",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFFFFF3C6)
              ),
            ),

            const SizedBox(height: 10),

            Text(
              bmi?.toString() ?? "--",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFFFFF3C6)
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: 250,
              height: 1,
              color: Color(0xFFFFF3C6),
            ),

            const SizedBox(height: 40),

            Text(
              "You are $category!",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFFFFF3C6)
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: 220,
              height: 60,
              
              child: ElevatedButton(
                key: const Key('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFF3C6),
                  foregroundColor: Color(0xFF374144),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectMetricScreen(),
                    ),
                  );
                },
                child: const Text("Done", 
                style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFFAC9846)
              ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}