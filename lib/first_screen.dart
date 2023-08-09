import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lesson2/provider_class.dart';
import 'package:provider_lesson2/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
      builder: (context, numbersProviderModel, child) => Scaffold(
        appBar: AppBar(
          title: const Text('First Screen'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbersProviderModel.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersProviderModel.numbers[index].toString(),
                      style: const TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5.0),
                    );
                  },
                )),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              color: Colors.blue,
              child: const Text(
                'Second Screen ->',
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    numbersProviderModel.add();
                  },
                  icon: const Icon(Icons.add)),
              Text(
                numbersProviderModel.numbers.last.toString(),
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    numbersProviderModel.substract();
                  },
                  icon: const Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
