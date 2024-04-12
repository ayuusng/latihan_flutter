import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
        title: const Text("Dunia Penuh Halu"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 100), // Adjust top padding
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent, // Ubah warna background drawer header
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/ft.jpeg'), // Ubah path sesuai dengan lokasi gambar Anda
                    radius: 30, // Sesuaikan ukuran avatar
                  ),
                  SizedBox(height: 10), // Tambahkan sedikit ruang antara gambar dan teks
                  Text(
                    'Ayu Kristin N S', // Nama pemilik
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'sngayuu126@gmail.com', // Email pemilik
                    style: TextStyle(
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Menu'),
              onTap: () {
                // Navigate to Home
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('List Tulis'), // Ubah tulisan dari "Tulis" menjadi "List Tulis"
              onTap: () {
                // Navigate to MenulisBukuPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenulisBukuPage()),
                );
              },
            ),
            ListTile(
              title: Text('Tentang'), // Menambahkan opsi "Tentang"
              onTap: () {
                // Navigate to AboutPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                // Navigate to Setting
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10), // Add some spac
          SizedBox(
            height: 150, // Increase the height of the image
            width: 200, // Expand the width of the image
            child: Image.network(
              'https://i.ytimg.com/vi/yd33DYggLJ4/maxresdefault.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mulai dari cerita-cerita romantis yang bikin baper, petualangan seru, sampe misteri yang bikin merinding, semuanya ada di sini! ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: feedWithBuilder(),
          ),
        ],
      ),
    );
  }

  Widget feedWithBuilder() {
    List<Map<String, String>> books = [
      {
        'image': 'https://tse3.mm.bing.net/th?id=OIP.9zcKzTEBGVSVMKpA9YqpiQAAAA&pid=Api&P=0&h=220',
        'title': 'Laut Pasang,1994 by: Lilipudu',
      },
      {
        'image': 'https://tse2.mm.bing.net/th?id=OIP.8BLJVpwXrMUorZ99fJF_5gAAAA&pid=Api&P=0&h=220',
        'title': 'Laut Pasang 1994 (Season 2)',
      },
      {
        'image': 'https://tse4.mm.bing.net/th?id=OIP.hNJQyr2gBgQRVnSUxF-BtgHaKp&pid=Api&P=0&h=220',
        'title': 'Aku Tak Membenci Hujan',
      },
      {
        'image': 'https://tse2.mm.bing.net/th?id=OIP.wz3_zQzgZstMlrwr888HIAHaLH&pid=Api&P=0&h=220',
        'title': 'Rintik Terakhir',
      },
      {
        'image': 'https://tse4.mm.bing.net/th?id=OIP.yNEZferSvRJrbTDEqdEoRQAAAA&pid=Api&P=0&h=220',
        'title': '00.00',
      },
    ];

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            color: Colors.blueGrey[500],
            child: Row(
              children: [
                Image.network(
                  books[index]['image']!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    books[index]['title']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenulisBukuPage extends StatelessWidget {
  const MenulisBukuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menulis Buku'),
      ),
      body: Center(
        child: Text('Halaman untuk menulis buku'),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang'),
      ),
      body: Center(
        child: Text('Ini adalah halaman tentang.'),
      ),
    );
  }
}
