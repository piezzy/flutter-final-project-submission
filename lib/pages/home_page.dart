import 'package:flutter/material.dart';
import 'product_page.dart';
import '../models/book.dart';

class HomePage extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: "Atomic Habits",
      author: "James Clear",
      description: "Buku tentang kebiasaan kecil yang berdampak besar.",
      imageUrl: "assets/images/atomic.jpg",
      price: 120000,
    ),
    Book(
      title: "Rich Dad Poor Dad",
      author: "Robert Kiyosaki",
      description: "Pendidikan finansial dari dua perspektif berbeda.",
      imageUrl: "assets/images/rich.jpg",
      price: 99000,
    ),
    Book(
      title: "Iqro",
      author: "As'ad Humam",
      description: "Buku ngaji",
      imageUrl: "assets/images/iqro.jpg",
      price: 35000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Buku")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(book: book),
                  ),
                );
              },
              child: Card(
                elevation: 3,
                child: Column(
                  children: [
                    Image.asset(
                      book.imageUrl,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        book.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Rp ${book.price.toInt()}",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
