import 'package:flutter/material.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({
    Key? key,
    required this.pizzaName,
    required this.price,
    required this.description,
  }) : super(key: key);

  final String pizzaName;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    // URL gambar pizza
    final String imageURL =
        'https://tse3.mm.bing.net/th?id=OIP.Axk-f0Nl-okhUCo_G4XhtgHaFk&pid=Api&P=0&h=220';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pizza: $pizzaName', // Nama Pizza
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              imageURL,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Price: $price', // Harga Pizza
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: $description', // Deskripsi Singkat
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
}
}