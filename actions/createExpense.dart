import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/variables.dart';


class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key, required this.title});
  final String title;
  @override
  State<CreateExpense> createState() => _CreateExpenseState();
}

class _CreateExpenseState extends State<CreateExpense> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedCategory = '';

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

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
      print('Entered amount: $amount');
      print('Selected category: $_selectedCategory');
      switch (_selectedCategory){
        case "Dining":
          Provider.of<Data>(context, listen: false).dining = amount;
          Provider.of<Data>(context, listen: false).totalDining += amount;
          Provider.of<Data>(context, listen: false).budget -= amount;
          Provider.of<Data>(context, listen: false).total -= amount;
        case "Entertainment":
          Provider.of<Data>(context, listen: false).entertainment = amount;
          Provider.of<Data>(context, listen: false).totalEntertainment += amount;
          Provider.of<Data>(context, listen: false).budget -= amount;
          Provider.of<Data>(context, listen: false).total -= amount;
        case "Investment":
          Provider.of<Data>(context, listen: false).investment = amount;
          Provider.of<Data>(context, listen: false).totalInvestment += amount;
          Provider.of<Data>(context, listen: false).budget -= amount;
          Provider.of<Data>(context, listen: false).total -= amount;
      }

      // Clear the text field after submission
      _amountController.clear();
      _selectedCategory = '';
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
        title: const Text('Create Expense'),
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
            const SizedBox(height: 70),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('Dining'),
                _buildCategoryButton('Entertainment'),
                _buildCategoryButton('Investment'),
              ],
            ),
            const SizedBox(height: 70),
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

  Widget _buildCategoryButton(String category) {
    return ElevatedButton(
      onPressed: () => _onCategorySelected(category),
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedCategory == category ? const Color.fromARGB(255, 46, 118, 169) : null,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12), 
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(category),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}

