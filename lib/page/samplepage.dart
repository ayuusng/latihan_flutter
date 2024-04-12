import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});
  

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              child: Image(image: AssetImage("images/gng bromo.jpeg"))
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Gunung Bromo'),
              Icon(
                Icons.star,
                color: Colors.red[500],
              ),
              const Text('4.5'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Icon(
                Icons.call,
              ),
              Icon(
                Icons.send,
              ),
              Icon(
                Icons.share,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[Text('Call'), Text('Route'), Text('Share')],
          ),
          Container(
            child: Text(
              'Gunung Bromo adalah sebuah gunung berapi aktif di Jawa Timur, Indonesia.'
                'Gunung ini memiliki ketinggian 2.329 meter di atas permukaan laut dan berada dalam empat wilayah kabupaten,'
                'yakni Kabupaten Probolinggo, Kabupaten Pasuruan, Kabupaten Lumajang, dan Kabupaten Malang.'
                'Gunung Bromo terkenal sebagai objek wisata utama di Jawa Timur.'
                'Sebagai sebuah objek wisata, Bromo menjadi menarik karena statusnya sebagai gunung berapi yang masih aktif.'
                'Gunung Bromo termasuk dalam kawasan Taman Nasional Bromo Tengger Semeru.'
                ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'), trailing: new Icon(Icons.home),
            ),
            ListTile(
              title: const Text('Notification'),
              trailing: new Icon(Icons.notifications_none),
            ),
            Divider(
              height: 2,
            ),
            ListTile(
              title: const Text('Setting'), trailing: new Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }
}