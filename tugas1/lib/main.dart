import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Selamat Datang di Apps Belajar By Irfan Prayogi'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  // List of pages for BottomNavigationBar
  static const List<Widget> _pages = <Widget>[
    Text(
      'Home Page',
      style: TextStyle(fontSize: 24),
    ),
    Text(
      'Profile Page',
      style: TextStyle(fontSize: 24),
    ),
    Text(
      'Settings Page',
      style: TextStyle(fontSize: 24),
    ),
  ];

  // Update the counter and UI when increment button is pressed
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Handle BottomNavigationBar item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: _selectedIndex == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 48,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : _pages[
                _selectedIndex], // Switch between pages based on the selected index
      ),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          : null, // Only show FloatingActionButton on the first page (Home)
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped, // Handle navigation
      ),
    );
  }
}
