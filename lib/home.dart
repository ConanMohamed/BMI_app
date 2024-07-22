import 'dart:math';

import 'package:bmi/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ismale = true;
  int weight = 50;
  int age = 21;
  int heightVal = 170;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    expandedMaleIcon(context, 'male'),
                    expandedMaleIcon(context, 'female'),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.black),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(heightVal.toString(),style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 36),),
                            const Text(
                              'cm',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Slider(
                          inactiveColor:Colors.white60,
                            min: 90,
                            max: 220,
                            value: heightVal.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                heightVal = value.toInt();
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    expandedWeightAge(context, 'Weight'),
                    expandedWeightAge(context, 'Age'),
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).colorScheme.primary,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 16,
                child: TextButton(
                  onPressed: () {
                    var result = weight / pow(heightVal / 100, 2);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          result: result,
                          isMale: ismale,
                          age: age,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Calculate',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded expandedMaleIcon(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            ismale = type == 'male' ? true : false;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(vertical: 36),
          decoration: BoxDecoration(
            color: (ismale && type == 'male')
                ? Theme.of(context).primaryColor
                : (!ismale && type == 'female')
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                size: 90,
                type == 'male' ? Icons.male : Icons.female,
              ),
              Text(
                type == 'male' ? 'Male' : 'Female',
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded expandedWeightAge(BuildContext context, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(vertical: 36),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.black),
            ),
            Text(
              label == 'Weight' ? weight.toString() : age.toString(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 32),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      label == 'Weight' ? weight -= 1 : age -= 1;
                    });
                  },
                  icon: const Icon(Icons.remove),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      label == 'Weight' ? weight += 1 : age += 1;
                    });
                  },
                  icon: const Icon(Icons.add),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
