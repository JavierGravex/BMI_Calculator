import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:final_proj/main.dart';

void main() {

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Happy Paths', () {

    /*
    GIVEN I am on the Select Metric Screen, 
    WHEN I tap “Imperial”, 
    AND I select 5ft 8in for my height, I input 160lbs for my weight, 
    AND I select Male for my gender, AND I tap “Calculate”, 
    THEN I should see “Your BMI is 24.3 – You are Healthy!”.
    */ 

    testWidgets("Imperial testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Select Feet
          await tester.tap( find.byKey(const Key('Feet')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('5').last);
          await tester.pumpAndSettle();

          // Select Inches
          await tester.tap( find.byKey(const Key('Inches')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('8').last);
          await tester.pumpAndSettle();

          // Input Weight
          await tester.enterText(find.byKey(const Key('Weight')), '160');
          await tester.pumpAndSettle();

          // Select Gender
          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last); 
          await tester.pumpAndSettle();

          // Calculate
          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);
          expect(find.text('24.3'), findsOneWidget); 
          expect(find.text('You are Healthy!'), findsOneWidget);
    });
    
    /*
    GIVEN I am on the Select Metric Screen, 
    WHEN I tap “International”, 
    AND I input 173cm for my height, 72kg for my weight, 
    AND I select Male for my gender, AND I tap “Calculate”, 
    THEN I should see “Your BMI is 24.1 – You are Healthy!”.
    */ 

    testWidgets("International testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('International')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Input Height
          await tester.enterText(find.byKey(const Key('Centimeters')), '173');
          await tester.pumpAndSettle();

          // Input Weight
          await tester.enterText(find.byKey(const Key('Weight')), '72');
          await tester.pumpAndSettle();

          // Select Gender
          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last);
          await tester.pumpAndSettle();

          // Calculate
          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);
          expect(find.text('24.1'), findsOneWidget);  
          expect(find.text('You are Healthy!'), findsOneWidget);
    });
    
    /*
    GIVEN I am on the Select Metric Screen, 
    WHEN I tap “Imperial”, 
    AND I select 5ft 8in for my height, I input 190lbs for my weight, 
    AND I select Male for my gender, AND I tap “Calculate”, 
    THEN I should see “Your BMI is 28.9 – You are Overweight!”. 
    */

    testWidgets("Overweight testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Select Feet
          await tester.tap( find.byKey(const Key('Feet')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('5').last);
          await tester.pumpAndSettle();

          // Select Inches
          await tester.tap( find.byKey(const Key('Inches')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('8').last);
          await tester.pumpAndSettle();

          // Input Weight
          await tester.enterText(find.byKey(const Key('Weight')), '190');
          await tester.pumpAndSettle();

          // Select Gender
          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last);
          await tester.pumpAndSettle();

          // Calculate
          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);
          expect(find.text('28.9'), findsOneWidget); 
          expect(find.text('You are Overweight!'), findsOneWidget);  
    });

    /* 
    GIVEN I am on the Select Metric Screen, 
    WHEN I tap “International”, 
    AND I input 180cm for my height, 55kg for my weight, 
    AND I select Female for my gender, AND I tap “Calculate”, 
    THEN I should see “Your BMI is 17 – You are Underweight!”.
    */

    testWidgets("Underweight testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('International')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Input Height
          await tester.enterText(find.byKey(const Key('Centimeters')), '180');
          await tester.pumpAndSettle();

          // Input Weight
          await tester.enterText(find.byKey(const Key('Weight')), '55');
          await tester.pumpAndSettle();

          // Select Gender
          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Female').last); 
          await tester.pumpAndSettle();

          // Calculate
          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);
          expect(find.text('17.0'), findsOneWidget);  
          expect(find.text('You are Underweight!'), findsOneWidget); 
    });

    /*
    GIVEN I am on the Select Metric Screen, 
    WHEN I tap “Imperial”, 
    AND I select 5ft 8in for my height, I input 230lbs for my weight, 
    AND I select Male for my gender, AND I tap “Calculate”, 
    THEN I should see “Your BMI is 28.9 – You are Obese!”. 
    */

    testWidgets("Obese testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Select Feet
          await tester.tap( find.byKey(const Key('Feet')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('5').last);
          await tester.pumpAndSettle();

          // Select Inches
          await tester.tap( find.byKey(const Key('Inches')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('8').last);
          await tester.pumpAndSettle();

          // Input Weight
          await tester.enterText(find.byKey(const Key('Weight')), '230');
          await tester.pumpAndSettle();

          // Select Gender
          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last);
          await tester.pumpAndSettle();

          // Calculate
          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);
          expect(find.text('35.0'), findsOneWidget); 
          expect(find.text('You are Obese!'), findsOneWidget);
    });

    /*
    GIVEN I have completed my inputs (metric selected, weight, height, AND gender entered) 
    AND I am on the Results Screen 
    WHEN I tap “Done” 
    THEN I should be taken back to the Select Metric Screen.
    */

    testWidgets("Done testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Fill inputs to get to results
          await tester.tap( find.byKey(const Key('Feet')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('5').last);
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Inches')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('8').last);
          await tester.pumpAndSettle();

          await tester.enterText(find.byKey(const Key('Weight')), '160');
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last);
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);

          // Tap Done
          await tester.tap( find.byKey(const Key('Done')) );
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);
    });

    /*
    GIVEN I have completed my inputs (metric selected, weight, height, AND gender entered) 
    AND I am on the Results Screen 
    WHEN I tap “backButton” 
    THEN I should be taken back to the Calculate Screen.
    */

    testWidgets("Back to calculate testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          // Fill inputs to get to results
          await tester.tap( find.byKey(const Key('Feet')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('5').last);
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Inches')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('8').last);
          await tester.pumpAndSettle();

          await tester.enterText(find.byKey(const Key('Weight')), '160');
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Gender')) );
          await tester.pumpAndSettle();
          await tester.tap(find.text('Male').last);
          await tester.pumpAndSettle();

          await tester.tap( find.byKey(const Key('Calculate')) );
          await tester.pumpAndSettle();

          expect(find.text('Your BMI is:'), findsOneWidget);

          // Tap Back
          await tester.tap( find.byKey(const Key('backButton')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);
    });

    /*
    GIVEN I have selected a metric 
    AND I am on the Calculate Screen 
    WHEN I tap “backButton” 
    THEN I should be taken back to the Select Metric Screen.
    */

    testWidgets("Back to metric testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tap( find.byKey(const Key('Imperial')) );
          await tester.pumpAndSettle();

          expect(find.text('BMI Calculator'), findsOneWidget);

          await tester.tap( find.byKey(const Key('backButton')) );
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);
    });
  });

  group('Sad Paths', () {

    /*
    GIVEN I am on the Select Metric Screen, 
    WHEN I don’t tap on ‘Imperial’ or ‘International’, 
    THEN I should still be on the Select Metric Screen. 
    */

    testWidgets("No metric testing",
        (WidgetTester tester) async {
          
          await tester.pumpWidget(MyApp());
          await tester.pumpAndSettle();
          await tester.pump(const Duration(seconds: 5)); 
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);

          await tester.tapAt(const Offset(0, 0));
          await tester.pumpAndSettle();

          expect(find.textContaining('Select Metric'), findsOneWidget);
    });

    /*
    GIVEN I have selected International for the metric system 
    AND I am on the Calculate Screen, 
    WHEN I leave any of the required fields (weight, height, or gender) empty, 
    AND I tap on “Calculate”, 
    THEN I should still be on the same page 
    AND I should see an error message ‘Please fill in all fields.’. 
    */

    testWidgets("International Validation Error testing", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5)); 
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('International')));
      await tester.pumpAndSettle();

      // Attempt to calculate with null/empty values
      await tester.tap(find.byKey(const Key('Calculate')));
      await tester.pump(); // Start SnackBar animation

      // Verify the error message appears
      expect(find.text("Please fill in all fields."), findsOneWidget);

      // Verify we are still on the input screen
      expect(find.text('BMI Calculator'), findsOneWidget);
      expect(find.text('Your BMI is:'), findsNothing); 
    });

    /*
    GIVEN I have selected Imperial for the metric system 
    AND I am on the Calculate Screen, 
    WHEN I leave any of the required fields (weight, height, or gender) empty, 
    AND I tap on “Calculate”, 
    THEN I should still be on the same page 
    AND I should see an error message ‘Please fill in all fields.’. 
    */

    testWidgets("Imperial Validation Error testing", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5)); 
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('Imperial')));
      await tester.pumpAndSettle();

      // Attempt to calculate with null/empty values
      await tester.tap(find.byKey(const Key('Calculate')));
      await tester.pump(); // Start SnackBar animation

      // Verify the error message appears
      expect(find.text("Please fill in all fields."), findsOneWidget);

      // Verify we are still on the input screen
      expect(find.text('BMI Calculator'), findsOneWidget);
      expect(find.text('Your BMI is:'), findsNothing); 
    });

    /* 
    GIVEN I have selected International for the metric system 
    AND I am on the Calculate Screen, 
    WHEN I input my weight using any non-numeric characters (ex: @, #, *, -), 
    AND I tap on “Calculate”, 
    THEN I should still be on the same page 
    AND I should see an error message ‘Please fill in all fields.’ 
    */

    testWidgets("Special Characters ignored for International", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5)); 
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('International')));
      await tester.pumpAndSettle();

      // Attempt to enter invalid characters
      await tester.enterText(find.byKey(const Key('Centimeters')), '@-!*');
      await tester.pumpAndSettle();

      // Verify text is empty because the formatter blocked it
      expect(find.text('@-!*'), findsNothing);

      // Try to calculate
      await tester.tap(find.byKey(const Key('Calculate')));
      await tester.pump();
      
      // Should show validation error
      expect(find.text("Please fill in all fields."), findsOneWidget);
    });

    /* 
    GIVEN I have selected Imperial for the metric system 
    AND I am on the Calculate Screen, 
    WHEN I input my weight using any non-numeric characters (ex: @, #, *, -), 
    AND I tap on “Calculate”, 
    THEN I should still be on the same page 
    AND I should see an error message ‘Please fill in all fields.’ 
    */

    testWidgets("Special Characters ignored for Imperial", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5)); 
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('International')));
      await tester.pumpAndSettle();

      // Attempt to enter invalid characters
      await tester.enterText(find.byKey(const Key('Centimeters')), '@-!*');
      await tester.pumpAndSettle();

      // Verify text is empty because the formatter blocked it
      expect(find.text('@-!*'), findsNothing);

      // Try to calculate
      await tester.tap(find.byKey(const Key('Calculate')));
      await tester.pump();
      
      // Should show validation error
      expect(find.text("Please fill in all fields."), findsOneWidget);
    });
  });
}

// flutter test test/unit_tests.dart

// flutter test test/integration_tests.dart