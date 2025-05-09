import 'package:flutter/material.dart';
import '../services/calculator_service.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CalculatorService.history.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(CalculatorService.history[index]));
      },
    );
  }
}
