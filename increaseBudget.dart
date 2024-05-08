import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/variables.dart';

class IncreaseBudget extends StatefulWidget {
  const IncreaseBudget({super.key, required this.title});
  final String title;
  @override
  State<IncreaseBudget> createState() => _IncreaseBudgetState();
}

class _IncreaseBudgetState extends State<IncreaseBudget> {
  final TextEditingController _amountController = TextEditingController();

  void _submitExpense() {
    String enteredAmount = _amountController.text.trim();

    if (enteredAmount.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an amount')),
      );
      return;
    }
    try {
      double amount = double.parse(enteredAmount);
      if (amount <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a positive amount')),
        );
        return;
      }

      // Do something with the entered amount and selected category
      Provider.of<Data>(context, listen: false).budget += amount;
      Provider.of<Data>(context, listen: false).total += amount;
      print('Entered amount: $amount');

      // Clear the text field after submission
      _amountController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Budget'),
        backgroundColor: const Color.fromARGB(255, 46, 118, 169),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter amount (USD)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitExpense,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), 
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}