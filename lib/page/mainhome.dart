import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_word_1/models/petani.dart';
import 'package:hello_word_1/page/petaniPage.dart';
import 'package:hello_word_1/page/write_screen.dart';
import 'package:hello_word_1/page/about_screen.dart';
import 'package:hello_word_1/page/home.dart';
import 'package:hello_word_1/page/setting_screen.dart';
import 'package:hello_word_1/page/profile_screen.dart';
import 'package:hello_word_1/page/library.dart';
import 'package:hello_word_1/service/apiStatic.dart';


void main() {
  runApp(const MyRumah());
}

class MyRumah extends StatelessWidget {
  const MyRumah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Future<List<Petani>> futurePetani; // Perbaikan tipe data Future

  final ApiService apiStatic = ApiService();

  @override
  void initState() {
    super.initState();
    futurePetani =
        apiStatic.fetchPetani(); // Perbaikan inisialisasi futurePetani
  }

  final List<Widget> _screens = const [
    Home(),
    SettingScreen(),
    ProfileScreen(),
    MyLibrary(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Setting',
    'Profile',
    'Library',
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
        title: Text(_appBarTitles[_selectedIndex]),
        backgroundColor: Colors.blue,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 100),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/Ft.jpeg'),
                    radius: 30,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ayu Kristin N S',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    'sngayuu126@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Menu'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Write'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WriteScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
             ListTile(
              title: const Text('Petani'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DatasScreen(futurePetani: futurePetani)),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 150,
          //   width: 200,
          //   child: Image.network(
          //     'https://i.ytimg.com/vi/yd33DYggLJ4/maxresdefault.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     "Mulai dari cerita-cerita romantis yang bikin baper, petualangan seru, sampe misteri yang bikin merinding, semuanya ada di sini! ",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 16,
          //     ),
          //   ),
          // ),
          Expanded(
            flex: 4,
            child: _screens[_selectedIndex], // Gunakan widget baru untuk daftar buku
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Colors.black),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.black),
            label: 'Library',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
