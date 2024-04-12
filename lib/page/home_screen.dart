import 'package:flutter/material.dart';
import 'package:hello_word_1/components/asset_image_rounded.dart';
import 'package:hello_word_1/components/asset_image_widget.dart';
import 'package:hello_word_1/components/text_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'), // Menambahkan AppBar dengan judul 'Home'
      ),
      body: SingleChildScrollView( // Menggunakan SingleChildScrollView agar konten dapat di-scroll jika overflow
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text('Test 2'),
                ),
                Text('Test Row 2')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('test 1'), Text('test 2'), Text('Test 3')],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [Text('text 1'), Text('text 2')],
                ),
                Column(
                  children: [Text('text 1'), Text('text 2')],
                )
              ],
            ),
            Divider(),
            Card(
              color: Colors.amber,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              borderOnForeground: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('test'), Text('test')],
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: [Text('Home screen 1'), Text('Homescreen 2')]),
                Column(children: [Text('Test 1'), Text('Test 2')])
              ],
            ),
            Divider(),
            Card(
              child: Padding(
                  padding: EdgeInsets.all(40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Test 1'), Text('Test 2')],
                  )),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextContainer(
                  text: 'Column 1',
                  color: Colors.red,
                  key: ValueKey(1),
                ),
                TextContainer(
                    text: 'Column 2', color: Colors.green, key: ValueKey(2)),
                TextContainer(
                    text: 'Column 3', color: Colors.blue, key: ValueKey(3)),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AssetImageWidget(
                  imagePath: 'images/gng bromo.jpeg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                AssetImageRounded(imagePath: 'images/gng bromo.jpeg'),
                CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('images/gng bromo.jpeg'))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: ButtonBar(
        children: [ // Menambahkan ButtonBar sebagai bottomNavigationBar dengan children yang sesuai
          TextButton(
            onPressed: () {},
            child: Text('Button 1'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Button 2'),
          ),
        ],
      ),
    );
  }
}
