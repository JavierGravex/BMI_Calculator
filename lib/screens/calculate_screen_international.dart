import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necesario para los formatters
import 'results_screen.dart';

class CalculateScreenInternational extends StatefulWidget {
  final String metric;

  const CalculateScreenInternational({super.key, required this.metric});

  @override
  State<CalculateScreenInternational> createState() => _CalculateScreenInternationalState();
}

class _CalculateScreenInternationalState extends State<CalculateScreenInternational> {
  double? selectedHeightCm;
  double? selectedWeight;
  String? selectedGender;

  final List<String> genderOptions = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCFDFE2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFCFDFE2),
        elevation: 0,
        leading: IconButton(
          key: const Key('backButton'),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI Calculator",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF374144),
                ),
              ),
        
              const SizedBox(height: 20),
        
              // HEIGHT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Height  ", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      key: const Key('Centimeters'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            selectedHeightCm = null;
                          } else {
                            selectedHeightCm = double.tryParse(value);
                          }
                        });
                      },
                    ),
                  ),
                  const Text(" cm", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // WEIGHT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Weight  ", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: TextField(
                      key: const Key('Weight'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            selectedWeight = null;
                          } else {
                            selectedWeight = double.tryParse(value);
                          }
                        });
                      },
                    ),
                  ),
                  const Text(" kg", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                ],
              ),
        
              const SizedBox(height: 20),
        
              // GENDER
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Gender  ", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: DropdownButton<String>(
                      key: const Key('Gender'),
                      value: selectedGender,
                      underline: SizedBox(),
                      isExpanded: true,
                      hint: Text("Select", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
                      items: genderOptions.map((g) {
                        return DropdownMenuItem(value: g, child: Text(g));
                      }).toList(),
                      onChanged: (value) {
                        setState(() => selectedGender = value!);
                      },
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 30),
        
              // CALCULATE BUTTON
              SizedBox(
                width: 220,
                height: 60,
                child: ElevatedButton(
                  key: const Key('Calculate'),
                  
                  
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return const Color(0xFF374144);   
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return const Color(0xFF91A5AA);  
                        }
                        return const Color(0xFFCFDFE2);     
                      }),
                      foregroundColor: WidgetStateProperty.resolveWith((states) {
                        if (states.contains(WidgetState.pressed)) {
                          return Color(0xFFCFDFE2);              
                        }
                        if (states.contains(WidgetState.hovered)) {
                          return const Color(0xFF374144);   
                        }
                        return const Color(0xFF374144);     
                      }),
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      textStyle: WidgetStateProperty.all(
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.black,
                            width: 2                        
                          )
                          
                        ),
                      ),
                    ),



                  onPressed: () {
                    if (selectedHeightCm == null || selectedWeight == null || selectedGender == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in all fields."),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
        
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(
                          metric: widget.metric,
                          height: selectedHeightCm,
                          weight: selectedWeight,
                          gender: selectedGender,
                        ),
                      ),
                    );
                  },
                  child: const Text("Calculate"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}