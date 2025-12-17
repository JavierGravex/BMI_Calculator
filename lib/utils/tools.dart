// For class and functions
import 'dart:math';

class Bmi_Tools{

  // BMI Formula (Metric) — Most Common

	// BMI = weight (kg) / [height (m)]²

	// Example:
	// If you’re 70 kg and 1.75 m tall:
	// BMI = 70 / (1.75²) = 22.86

  static double metric_BMI(double weight, double height_m)
  {
    double bmi = weight / pow(height_m,2);

    return bmi;
  }

  // BMI Formula (Imperial)

	// BMI = 703 × weight (lb) / [height (in)]²

	// Example:
	// If you’re 160 lb and 68 inches tall:
	// BMI = 703 × 160 / (68²) = 24.32

    static double imperial_BMI(double weight, double height_in)
  {
    double bmi = 703 * weight / pow(height_in,2);

    return bmi;
  }


//   Calculate how much weight it need to gain/loose.

// Metric

// MaxHealthyWeight_kg = 24.9 × (height_m)²

// MinHealthyWeight_kg = 18.5 × (height_m)²

// If BMI > 24.9 → overweight → weight to lose = current weight − MaxHealthyWeight

// If BMI < 18.5 → underweight → weight to gain = MinHealthyWeight − current weight

  static double metric_WeightToLoseOrGain(double weight, double bmi, double height_m) 
  {
    double maxHealthy = 24.9 * pow(height_m, 2);
    double minHealthy = 18.5 * pow(height_m, 2);

    if (bmi > 24.9) {
      return weight - maxHealthy; // need to lose
    } 
    else if (bmi < 18.5) {
      return minHealthy - weight; // need to gain
    } 
    else {
      return 0; // healthy weight
    }
  }


// Imperial

// MaxHealthyWeight_lb = 24.9 × (height_in)² / 703

// MinHealthyWeight_lb = 18.5 × (height_in)² / 703

// If BMI > 24.9 → overweight → weight to lose = current weight − MaxHealthyWeight

// If BMI < 18.5 → underweight → weight to gain = MinHealthyWeight − current weight

  static double imperial_WeightToLoseOrGain(double weight, double bmi, double height_in) 
  {
    double maxHealthy = 24.9 * pow(height_in, 2) / 703;
    double minHealthy = 18.5 * pow(height_in, 2) / 703;

    if (bmi > 24.9) {
      return weight - maxHealthy; // need to lose
    } 
    else if (bmi < 18.5) {
      return minHealthy - weight; // need to gain
    } 
    else {
      return 0; // healthy weight
    }
  }

  static String bmiCategory(double bmi) {
  if (bmi < 18.5) {
    return "Underweight";
  } 
  else if (bmi >= 18.5 && bmi <= 24.9) {
    return "Healthy";
  } 
  else if (bmi >= 25.0 && bmi <= 29.9) {
    return "Overweight";
  } 
  else {
    return "Obese";
  }
}

}