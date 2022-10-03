import 'package:fireflutter/hello.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import './src/sample_feature/sample_item_list_view.dart';
import './src/sample_feature/sample_item_details_view.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      routes: {
        '/': (context) => const MyStatefulWidget(),
        '/sample_item': (context) => const SampleItemDetailsView(),
        '/sample_list': (context) => const SampleItemListView(),
      },
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Hello(),
    SampleItemListView(),
    SampleItemListView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: Image.asset('placeholder.jpg', scale: 1),
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
