import 'package:flutter/material.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  List<String> stories = [];

  TextEditingController storyController = TextEditingController();

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tulis Cerita',
          style: TextStyle(color: Colors.black), // Warna teks judul
        ),
        iconTheme: IconThemeData(color: Colors.black), // Warna ikon kembali
        backgroundColor: Colors.blue, // Warna background app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: storyController,
              decoration: InputDecoration(
                hintText: 'Tulis cerita di sini...',
                border: OutlineInputBorder(),
              ),
              maxLines: null,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  stories.add(storyController.text);
                  storyController.clear();
                });
              },
              child: Text('Simpan Cerita'),
            ),
            SizedBox(height: 16),
            Text(
              'Cerita Tersimpan:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(stories[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _editStory(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteStory(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editStory(int index) {
    storyController.text = stories[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Cerita'),
          content: TextField(
            controller: storyController,
            decoration: InputDecoration(
              hintText: 'Edit cerita di sini...',
            ),
            maxLines: null,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Simpan'),
              onPressed: () {
                setState(() {
                  stories[index] = storyController.text;
                  storyController.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _deleteStory(int index) {
    setState(() {
      stories.removeAt(index);
    });
  }
}
