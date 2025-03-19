import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  double heightval = 170;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: Text('Body mass index', style: TextStyle(color: Colors.white)),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    gendere(context, 'male'),
                    SizedBox(width: 20),
                    gendere(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blueGrey,
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Height",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            heightval.toStringAsFixed(2),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text('CM'),
                        ],
                      ),

                      Slider(
                        thumbColor: Colors.teal,
                        activeColor: Colors.teal,
                        inactiveColor: Colors.grey,
                        max: 300,
                        min: 50,
                        value: heightval,
                        onChanged: (newvalue) {
                          setState(() {
                            heightval = newvalue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    gendere2(context, 'weight'),
                    SizedBox(width: 20),
                    gendere2(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.teal,
              ),

              width: double.infinity,
              height: MediaQuery.of(context).size.height / 20,
              child: TextButton(
                onPressed: () {
                  double Resultt = weight / pow(heightval / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              Result(result: Resultt, ismale: ismale, age: age),
                    ),
                  );
                },

                child: Text('calculate', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded gendere(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                (ismale && type == 'male') || (!ismale && type == 'female')
                    ? Colors.teal
                    : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == 'male' ? Icons.male : Icons.female, size: 90),
              SizedBox(height: 16),
              Text(
                type == 'male' ? 'male' : 'female',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded gendere2(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'age' ? 'age' : 'weight',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: 16),
            Text(
              type == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.teal,

                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age-- : weight--;
                    });
                  },
                  child: Icon(Icons.remove, color: Colors.white),
                  mini: true,
                ),
                SizedBox(width: 30),
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'age' ? age++ : weight++;
                    });
                  },
                  child: Icon(Icons.add, color: Colors.white),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
