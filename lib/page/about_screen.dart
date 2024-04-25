import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Aplikasi Ini',
          style: TextStyle(color: Colors.black), // Warna teks judul
        ),
        iconTheme: IconThemeData(color: Colors.black), // Warna ikon kembali
        backgroundColor: Colors.blue, // Warna background app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Container( // Container untuk judul "Dunia Penuh Halu"
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration( // Properti decoration untuk kotak berwarna biru langit
                color: Colors.lightBlueAccent, // Warna background
                borderRadius: BorderRadius.circular(10.0), // Bentuk border
              ),
              child: Text(
                'Dunia Penuh Halu',
                style: TextStyle(
                  color: Colors.black, // Warna teks
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container( // Container untuk judul "Deskripsi Aplikasi" dan deskripsi aplikasi
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration( // Properti decoration untuk kotak berwarna biru muda
                color: Colors.white, // Warna background
                borderRadius: BorderRadius.circular(10.0), // Bentuk border
              ),
              child: Column( // Menggunakan Column untuk menempatkan judul dan deskripsi dalam satu wadah
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deskripsi Aplikasi:',
                    style: TextStyle(
                      color: Colors.black, // Warna teks
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Memberikan jarak antara judul dan deskripsi
                  Text(
                    'Dunia Penuh Halu adalah aplikasi yang memuat berbagai macam cerita menarik, mulai dari cerita romantis, petualangan seru, hingga misteri yang mencekam. Nikmati pengalaman membaca yang seru dan memikat di aplikasi ini!',
                    style: TextStyle(
                      color: Colors.black, // Warna teks
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
