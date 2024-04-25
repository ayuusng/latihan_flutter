import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_word_1/page/write_screen.dart';
import 'package:hello_word_1/page/about_screen.dart';

 // Import halaman about

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(Icons.menu),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //       );
      //     },
      //   ),
      //   title: const Text("Dunia Penuh Halu"),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: const EdgeInsets.only(top: 100),
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             CircleAvatar(
      //               backgroundImage: AssetImage('images/Ft.jpeg'),
      //               radius: 30,
      //             ),
      //             SizedBox(height: 10),
      //             Text(
      //               'Ayu Kristin N S',
      //               style: TextStyle(
      //                 color: Colors.white,
      //                 fontSize: 24,
      //               ),
      //             ),
      //             Text(
      //               'sngayuu126@gmail.com',
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Menu'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Write'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => WriteScreen()),
      //           );
      //         },
      //       ),
      //       ListTile(
      //         title: Text('About'),
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => AboutScreen()),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          SizedBox(
            height: 150,
            width: 200,
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
            child: FeedWithBuilder(), // Gunakan widget baru untuk daftar buku
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan daftar buku
class FeedWithBuilder extends StatelessWidget {
  const FeedWithBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> books = [
      {
        'image':
            'https://tse3.mm.bing.net/th?id=OIP.9zcKzTEBGVSVMKpA9YqpiQAAAA&pid=Api&P=0&h=220',
        'title': 'Laut Pasang,1994 by: Lilipudu',
      },
      {
        'image':
            'https://tse2.mm.bing.net/th?id=OIP.8BLJVpwXrMUorZ99fJF_5gAAAA&pid=Api&P=0&h=220',
        'title': 'Laut Pasang 1994 (Season 2)',
      },
      {
        'image':
            'https://tse4.mm.bing.net/th?id=OIP.hNJQyr2gBgQRVnSUxF-BtgHaKp&pid=Api&P=0&h=220',
        'title': 'Aku Tak Membenci Hujan',
      },
      {
        'image':
            'https://tse2.mm.bing.net/th?id=OIP.wz3_zQzgZstMlrwr888HIAHaLH&pid=Api&P=0&h=220',
        'title': 'Rintik Terakhir',
      },
      {
        'image':
            'https://tse4.mm.bing.net/th?id=OIP.yNEZferSvRJrbTDEqdEoRQAAAA&pid=Api&P=0&h=220',
        'title': '00.00',
      },
      {
        'image':
            'https://tse2.mm.bing.net/th?id=OIP.-GKsg-GvrzXtVTjQPaiixwHaJl&pid=Api&P=0&h=220',
        'title': '01.00',
      },
      {
        'image':
            'https://tse4.mm.bing.net/th?id=OIP.ZYXS334AUYsJlZenLTayywHaJl&pid=Api&P=0&h=220',
        'title': 'Dia Angkasa',
      },
      {
        'image':
            'https://tse1.mm.bing.net/th?id=OIP.pRGtsjaNoAeDgfPlX9kuGQAAAA&pid=Api&P=0&h=220',
        'title': 'Eccedentesiast',
      },
      {
        'image':
            'https://tse3.mm.bing.net/th?id=OIP.IQOf3-Y7fvF1m9fHaPBWqAAAAA&pid=Api&P=0&h=220',
        'title': 'Ezaquel',
      },
      {
        'image':
            'https://tse1.mm.bing.net/th?id=OIP.lgLqpq5fgP32mBEL5Cyo2wHaKs&pid=Api&P=0&h=220',
        'title': 'Areksa',
      },
    ];

    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150,
            color: Colors.lightBlue[500],
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
