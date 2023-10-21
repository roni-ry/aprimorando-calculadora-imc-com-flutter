import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: MaterialApp(
      title: 'Calculadora IMC',
      home: Home(),
    ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController alturaController = TextEditingController(text: "");
  TextEditingController pesoController = TextEditingController(text: "");

  double? get altura => double.tryParse(alturaController.text) ?? 0;
  double? get peso => double.tryParse(pesoController.text) ?? 0;

  double calcIMC() {
    double result = 0;
    var res = peso! / (altura! * altura!);
    if (res.isNaN) {
      result = 0;
    } else {
      result = peso! / (altura! * altura!);
    }
    return result;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nomeController.dispose();
    alturaController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null),
        title: const Text('IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                alignment: Alignment.center,
                child: const Text(
                  'Calculadora IMC',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Nome', border: OutlineInputBorder()),
                  autocorrect: true,
                  keyboardType: TextInputType.name,
                  controller: nomeController,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Altura', border: OutlineInputBorder()),
                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  controller: alturaController,
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  decoration: const InputDecoration(
                      hintText: 'Peso', border: OutlineInputBorder()),
                  autocorrect: true,
                  keyboardType: TextInputType.number,
                  controller: pesoController,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                alignment: Alignment.center,
                child: TextField(
                  readOnly: true,
                  enabled: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: calcIMC().toStringAsFixed(2),
                      hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 7, 73, 255))),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(120, 40))),
                  onPressed: () {},
                  child: const Text(
                    'Calcular',
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
