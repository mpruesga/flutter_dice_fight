import 'package:flutter/material.dart';
import 'package:custom_app_test/gradient_container.dart';

var colores = [Color.fromARGB(255, 1, 57, 102), Color.fromARGB(255, 1, 114, 206)];
void main() {
  runApp(
    const MaterialApp(
    home: Scaffold(
      body: GradientContainer(
          [Color.fromARGB(255, 1, 57, 102), Color.fromARGB(255, 206, 1, 1)]),
    ),
  ));
}
