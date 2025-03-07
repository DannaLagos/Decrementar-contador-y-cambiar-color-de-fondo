import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 230, 134, 56)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 10;
  bool _isBoom = false;

  void _incrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
      if (_counter == 0) {
        _isBoom = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: _isBoom ? Colors.orange : Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _counter == 0
                    ? '¡¡¡BOOM!!!'
                    : 'Haga clic antes de la explosión',
                style: TextStyle(
                  color: _isBoom
                      ? const Color.fromARGB(255, 239, 15, 15)
                      : Colors.black,
                  fontSize: _isBoom
                      ? 50
                      : 20, // Cambia el tamaño de fuente a 50 cuando _isBoom es true
                ),
              ),
              if (_counter >
                  0) // Mostrar el texto solo si el contador es mayor que 0
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              if (_counter > 0)
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/bomba2.jpg', // Ruta de la imagen de la bomba
                    width: 100, // Ancho de la imagen
                    height: 100, // Alto de la imagen
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter > 0 ? _incrementCounter : null,
        tooltip: 'Incrementar',
        backgroundColor:
            _isBoom ? const Color.fromARGB(255, 230, 134, 56) : null,
        child: const Icon(Icons.remove),
      ),
    );
  }
}
