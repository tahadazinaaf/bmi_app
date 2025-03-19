import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.ismale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool ismale;
  final int age;

  String get resultPhrase {
    if (result >= 30) {
      return 'Obese';
    } else if (result >= 25) {
      return 'Overweight';
    } else if (result >= 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your BMI Result",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildInfoCard(
                icon: ismale ? Icons.male : Icons.female,
                title: "Gender",
                value: ismale ? 'Male' : 'Female',
                color: Colors.blueAccent,
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                icon: Icons.monitor_weight,
                title: "BMI Result",
                value: result.toStringAsFixed(2),
                color: Colors.green,
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                icon: Icons.calendar_today,
                title: "Age",
                value: "$age years",
                color: Colors.orange,
              ),
              const SizedBox(height: 15),
              buildInfoCard(
                icon: Icons.favorite,
                title: "Health Status",
                value: resultPhrase,
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: color),
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
