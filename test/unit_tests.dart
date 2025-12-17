import 'package:flutter_test/flutter_test.dart';
import 'dart:math';
import 'package:final_proj/utils/tools.dart';

void main() {
  
  group("BMI weight Test ", () {
    
    test('Metric BMI Calculation', () {
      double weight = 70;
      double height = 1.75;
      double expectedBMI = 22.86;

      expect(Bmi_Tools.metric_BMI(weight, height), closeTo(expectedBMI, 0.01));
      
    });

    test('Imperial BMI Calculation', () {
      double weight = 160;
      double height = 68;
      double expectedBMI = 24.32;

      expect(Bmi_Tools.imperial_BMI(weight, height), closeTo(expectedBMI, 0.01));
      
    });


    test('Metric Overweight → should return weight to lose', () {
      
      double weight = 80;
      double height = 1.75; 
      double bmi = Bmi_Tools.metric_BMI(weight, height); //= 26.12
     
          // Expected max healthy weight
    double expectedMaxHealthy = 24.9 * pow(height, 2); // 76.25 kg 
    double expectedWeightToLose = weight - expectedMaxHealthy; // 80 - 76.25 = 3.74 kg

    expect(Bmi_Tools.metric_WeightToLoseOrGain(weight, bmi, height),closeTo(expectedWeightToLose, 0.001),);
    });

     test('Metric Underweight → should return weight to gain', () {
    // Example: 45kg, 1.75m
      double weight = 45;
      double height = 1.75;
      double bmi = Bmi_Tools.metric_BMI(weight, height); //14.69 BMI

      double expectedMinHealthy = 18.5 * pow(height, 2);  //56.65 kg
      double expectedWeightToGain = expectedMinHealthy - weight; //56.65 - 45 = 11.65 kg 

      expect(
        Bmi_Tools.metric_WeightToLoseOrGain(weight, bmi, height),
        closeTo(expectedWeightToGain, 0.01),
      );
    });

     test('Metric Healthy Weight → should return zero', () {
    // Example: pick a weight that produces a healthy BMI
    double weight = 68; 
    double height = 1.75;
    double bmi = Bmi_Tools.metric_BMI(weight, height); // 22.20 BMI

    expect(
      Bmi_Tools.metric_WeightToLoseOrGain(weight, bmi, height),
      equals(0),
    );
  });

    test('Imperial Overweight → should return weight to lose', () {
      
      double weight = 168;
      double height = 68;
      double bmi = Bmi_Tools.imperial_BMI(weight, height); //= 25.54
     
          // Expected max healthy weight
    double expectedMaxHealthy = 24.9 * pow(height, 2) / 703; //= 123.29
    double expectedWeightToLose = weight - expectedMaxHealthy;//168 - 123.29 = 44.71 lbs

    expect(Bmi_Tools.imperial_WeightToLoseOrGain(weight, bmi, height),closeTo(expectedWeightToLose, 0.001),);
    });

     test('Imperial Underweight → should return weight to gain', () {
    
      double weight = 90;
      double height = 59;
      double bmi = Bmi_Tools.imperial_BMI(weight, height); //18.17

      double expectedMinHealthy = 18.5 * pow(height, 2) / 703; //= 91
      double expectedWeightToGain = expectedMinHealthy - weight; //91 - 90 = 1

      expect(
        Bmi_Tools.imperial_WeightToLoseOrGain(weight, bmi, height),
        closeTo(expectedWeightToGain, 0.01),
      );
    });


  test('Imperial Healthy Weight → should return zero', () {
    // Example: pick a weight that produces a healthy BMI
    double weight = 135; 
    double height = 62;
    double bmi = Bmi_Tools.imperial_BMI(weight, height);//22.86 BMI

    expect(
      Bmi_Tools.imperial_WeightToLoseOrGain(weight, bmi, height),
      equals(0),
    );
  });




















  });
}
