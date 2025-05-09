import 'package:flutter/material.dart';
import 'package:fllutter_test_app/services/calculator_service.dart';
import 'package:fllutter_test_app/widgets/calc_button.dart';
import 'package:fllutter_test_app/widgets/display.dart';
import 'package:fllutter_test_app/widgets/history_list.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String displayText = '0';

  void numClick(String text) {
    setState(() {
      displayText = CalculatorService.appendInput(displayText, text);
    });
  }

  void clearDisplay() {
    setState(() {
      displayText = '0';
    });
  }

  void deleteLast() {
    setState(() {
      displayText = CalculatorService.deleteLast(displayText);
    });
  }

  void calculateResult() {
    setState(() {
      displayText = CalculatorService.calculate(displayText);
    });
  }

  void percent() {
    setState(() {
      double value = double.tryParse(displayText.replaceAll(',', '')) ?? 0;
      value = value / 100;
      displayText = CalculatorService.formatNumber(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kalkulator Flutter')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Display utama
            Display(text: displayText),

            SizedBox(height: 12),

            Container(
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: HistoryList(),
            ),

            SizedBox(height: 12),

            // Grid Tombol
            Expanded(
              child: Column(
                children: [
                  // Baris 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(text: '7', onTap: () => numClick('7')),
                      CalcButton(text: '8', onTap: () => numClick('8')),
                      CalcButton(text: '9', onTap: () => numClick('9')),
                      CalcButton(
                        text: '÷',
                        onTap: () => numClick('/'),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(text: '4', onTap: () => numClick('4')),
                      CalcButton(text: '5', onTap: () => numClick('5')),
                      CalcButton(text: '6', onTap: () => numClick('6')),
                      CalcButton(
                        text: '×',
                        onTap: () => numClick('×'),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(text: '1', onTap: () => numClick('1')),
                      CalcButton(text: '2', onTap: () => numClick('2')),
                      CalcButton(text: '3', onTap: () => numClick('3')),
                      CalcButton(
                        text: '−',
                        onTap: () => numClick('-'),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalcButton(
                        text: 'C',
                        onTap: clearDisplay,
                        color: Colors.red,
                      ),
                      CalcButton(text: '0', onTap: () => numClick('0')),
                      CalcButton(
                        text: '⌫',
                        onTap: deleteLast,
                        color: Colors.grey,
                      ),
                      CalcButton(
                        text: '+',
                        onTap: () => numClick('+'),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                  // Tombol '=' full lebar
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton(
                      onPressed: calculateResult,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35),
                        ),
                      ),
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
