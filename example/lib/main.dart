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
    const StepperData(
      title: "Order Placed",
      subtitle: "Your order has been placed",
    ),
    const StepperData(
      title: "Preparing",
      subtitle: "Your order is being prepared",
    ),
    const StepperData(
      title: "On the way",
      subtitle:
          "Our delivery executive is on Our delivery executive is on Our delivery executive is on",
    ),
    const StepperData(
      title: "Delivered",
      subtitle: "Your order was delivered successfully",
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
            trailingWidgets: const [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24,
              ),
            ],
            stepperDirection: Axis.vertical,
            dotWidget: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Icon(Icons.fastfood, color: Colors.white),
            ),
            activeBarColor: Colors.green,
            inActiveBarColor: Colors.grey,
            activeIndex: 2,
            barThickness: 8,
          ),
        ),
      ),
    );
  }
}
