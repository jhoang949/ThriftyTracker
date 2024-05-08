import 'package:flutter/material.dart';
import 'package:flutter_application_2/actions/increaseBudget.dart';
import 'actions/setBudget.dart';
import 'actions/createExpense.dart';



class MyActionPage extends StatefulWidget {
  const MyActionPage({super.key, required this.title});
  final String title;
  @override
  State<MyActionPage> createState() => _MyActionPageState();
}

class _MyActionPageState extends State<MyActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Action'),
        backgroundColor: const Color.fromARGB(255, 46, 118, 169),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const SetBudget(title: 'Set Budget')),
                );
              },
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              minimumSize: const Size(200, 60), 
              textStyle: const TextStyle(fontSize: 20), 
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 46, 118, 169),
              ),
              child: const Text('Set New Budget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const CreateExpense(title: 'Create Expense')),
                );
              },
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              minimumSize: const Size(200, 60), 
              textStyle: const TextStyle(fontSize: 20), 
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 46, 118, 169),
              ),
              child: const Text('Create Expense Instance'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const IncreaseBudget(title: 'Increase Budget')),
                );
              },
              style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              minimumSize: const Size(200, 60), 
              textStyle: const TextStyle(fontSize: 20), 
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255),
              backgroundColor: const Color.fromARGB(255, 46, 118, 169),
              ),
              child: const Text('Increase Budget'),
            ),
          ],
        ),
      ),
    );
  }
}
