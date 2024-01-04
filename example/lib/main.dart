import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<StepperData> stepperData = [
    StepperData(
      title: const Text("Order Placeded"),
      subtitle: const Text("Your order has been placed"),
      leadingWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.fastfood, color: Colors.white),
      ),
    ),
    StepperData(
      title: const Text("Preparing"),
      subtitle: const Text("Your order is being prepared"),
      leadingWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.fastfood, color: Colors.white),
      ),
    ),
    StepperData(
      title: const Text("On the way"),
      subtitle: const Text(
          "Our delivery executive is on Our delivery executive is on Our delivery executive is on"),
      leadingWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.fastfood, color: Colors.white),
      ),
      trailingWidget: const Icon(Icons.mouse),
    ),
    StepperData(
      title: const Text("Delivered"),
      subtitle: const Text("Your order was delivered successfully"),
      leadingWidget: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: const Icon(Icons.access_alarm, color: Colors.white),
      ),
      trailingWidget: const Icon(Icons.bluetooth),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: AnotherStepper(
            stepperList: stepperData,
            stepperDirection: Axis.vertical,
            activeBarColor: Colors.green,
            inActiveBarColor: Colors.grey,
            activeIndex: 1,
            barThickness: 8,
          ),
        ),
      ),
    );
  }
}
