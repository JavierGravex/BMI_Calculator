import 'package:flutter/material.dart';
import 'calculate_screen_imperial.dart';
import 'calculate_screen_international.dart';

class SelectMetricScreen extends StatefulWidget {
  const SelectMetricScreen({super.key});

  @override
  State<SelectMetricScreen> createState() => _SelectMetricScreenState();
}

class _SelectMetricScreenState extends State<SelectMetricScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFFCFDFE2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text (
              "Select Metric \n System",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 220,
              height: 60,

              child: ElevatedButton(
                key: const Key('Imperial'),

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CalculateScreenImperial(metric: "Imperial") ),
                      );
                },
                child: const Text("Imperial",
                style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 220,
              height: 60,
              child: ElevatedButton(
                key: const Key('International'),


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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CalculateScreenInternational(metric: "International") ),
                  );
                },
                child: const Text("International", style: TextStyle(
                fontFamily: 'AlbertSans-SemiBold',
                color: Color(0xFF374144),
              )),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}