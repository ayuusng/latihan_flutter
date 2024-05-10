import 'package:flutter/material.dart';
import 'package:hello_word_1/routes/main.dart';
import 'package:hello_word_1/models/petani.dart';
import 'package:hello_word_1/page/detailPetani.dart';
import 'package:hello_word_1/page/TambahEdit_Petani_Page.dart';
import 'package:hello_word_1/service/apiStatic.dart';

class PetaniPage extends StatefulWidget {
  const PetaniPage({
    super.key,
    required this.futurePetani,
  });

  final Future<List<Petani>> futurePetani;

  @override
  State<PetaniPage> createState() => _PetaniPageState();
}

class _PetaniPageState extends State<PetaniPage> {
  late final APiService _apiService;

  @override
  void initState() {
    super.initState();
    _apiService = APiService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petani List'),
      ),
      body: Center(
        child: FutureBuilder<List<Petani>>(
          future: widget.futurePetani,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Display a loading indicator while waiting for the future
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Display an error message if there's an error
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Display the list of Petani if data is available
              final List<Petani> petaniList = snapshot.data!;
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {});
                },
                child: ListView.builder(
                  itemCount: petaniList.length,
                  itemBuilder: (BuildContext context, int index) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DetailPetaniPage(
                                petani: petaniList[index],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage("${petaniList[index].foto}"),
                                  radius: 20,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  '${petaniList[index].nama}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    // Add code for edit action here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditFormPetani(
                                          petani: petaniList[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async {
                                    final confirmed = await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Confirm Delete'),
                                          content: const Text(
                                              'Are you sure you want to delete this petani?'),
                                          actions: [
                                            TextButton(
                                              child: const Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(false);
                                              },
                                            ),
                                            TextButton(
                                              child: const Text('Delete'),
                                              onPressed: () async {
                                                try {
                                                  final idPenjual =
                                                      petaniList[index]
                                                          .idPenjual;
                                                  if (idPenjual != null) {
                                                    await _apiService
                                                        .deletePetani(
                                                            idPenjual);
                                                    setState(() {});
                                                  }
                                                } catch (e) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                          'Failed to delete petani: $e'),
                                                    ),
                                                  );
                                                }
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyApp(),
                                                    // builder: (context) => HomePage(futurePetani: futurePetani),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (confirmed) {
                                      // Add code for delete action here
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else {
              // Default case: Display a message when there's no data
              return const Text('No data available');
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditFormPetani(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}