import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_lesson2/provider_class.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersProvider>(
        builder: (context, numberProviderModel, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Second Screen'),
                backgroundColor: Colors.deepPurple,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: numberProviderModel.numbers.length,
                      itemBuilder: (context, index) {
                        return Text(
                          numberProviderModel.numbers[index].toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    color: Colors.deepPurple,
                    child: const Text(
                      '<- First Screen',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          numberProviderModel.add();
                        },
                        icon: const Icon(Icons.add)),
                    Text(
                      numberProviderModel.numbers.last.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          numberProviderModel.substract();
                        },
                        icon: const Icon(Icons.remove)),
                  ],
                ),
              ),
            ));
  }
}
