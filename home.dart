import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'variables.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 46, 118, 169),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            _buildValueItem('Budget', Provider.of<Data>(context).budget, Colors.green),
            const SizedBox(height: 20),
            _buildValueItem('Dining', Provider.of<Data>(context).dining, Colors.red),
            const SizedBox(height: 10),
            _buildValueItem('Entertainment', Provider.of<Data>(context).entertainment, Colors.red),
            const SizedBox(height: 10),
            _buildValueItem('Investment', Provider.of<Data>(context).investment, Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValueItem(String label, double value, Color color) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '\$${value.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
