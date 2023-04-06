import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'localStorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (_, themeProvider, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode:
                themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) {
              return Switch(
                value: themeProvider.isDarkTheme,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Hello World!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
