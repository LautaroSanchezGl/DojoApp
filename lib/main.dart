import 'package:dojoapp/data/api_service.dart';
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
      title: 'Dojo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dojo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  final ApiService apiService = const ApiService();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String>? moviesRawJson;

  void getMoviesRawJson() {
    moviesRawJson = widget.apiService.getMoviesRawJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Fetch Movies Raw Json',
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    getMoviesRawJson();
                  });
                },
                child: const Text(
                  'Go',
                ),
              ),
              FutureBuilder(
                initialData: 'No content loaded yet',
                future: moviesRawJson,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!,
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  } else if (snapshot.hasError) {
                    return const Text('error');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
