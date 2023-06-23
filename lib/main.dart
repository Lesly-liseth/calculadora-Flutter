import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Calculadora Basica'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _number1Controller = TextEditingController();
  TextEditingController _number2Controller = TextEditingController();
  double _result = 0;

  void _calculateSum() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      _result = number1 + number2;
    });
  }

  void _calculateSubtraction() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      _result = number1 - number2;
    });
  }

  void _calculateMultiplication() {
    double number1 = double.tryParse(_number1Controller.text) ?? 0;
    double number2 = double.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      _result = number1 * number2;
    });
  }

  void _calculateSine() {
    double number = double.tryParse(_number1Controller.text) ?? 0;
    double radians = number * (pi / 180); // Convierte de grados a radianes
    setState(() {
      _result = sin(radians);
    });
  }

  void _calculateCosine() {
    double number = double.tryParse(_number1Controller.text) ?? 0;
    double radians = number * (pi / 180); // Convierte de grados a radianes
    setState(() {
      _result = cos(radians);
    });
  }

  void _calculateTangent() {
    double number = double.tryParse(_number1Controller.text) ?? 0;
    double radians = number * (pi / 180); // Convierte de grados a radianes
    setState(() {
      _result = tan(radians);
    });
  }

  void _clearInputs() {
    _number1Controller.clear();
    _number2Controller.clear();
    setState(() {
      _result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            TextField(
              controller: _number1Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Numero 1',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _number2Controller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Numero 2',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _calculateSum,
                  child: const Text(
                    'Suma',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 236, 150, 222)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _calculateSubtraction,
                  child: const Text(
                    'Resta',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 236, 150, 222)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _calculateMultiplication,
                  child: const Text(
                    'Multiplicación',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 236, 150, 222)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _calculateSine,
                  child: const Text(
                    'Seno',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 201, 136, 255)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _calculateCosine,
                  child: const Text(
                    'Coseno',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 201, 136, 255)),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _calculateTangent,
                  child: const Text(
                    'Tangente',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 201, 136, 255)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _clearInputs,
              child: const Text('Limpiar'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.pink),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE4D4), // Color piel
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Resultado: $_result',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
