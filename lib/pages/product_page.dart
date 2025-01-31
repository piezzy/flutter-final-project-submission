import 'package:flutter/material.dart';
import '../models/book.dart';

class ProductPage extends StatefulWidget {
  final Book book;

  ProductPage({required this.book});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int cartQuantity = 0;

  void _addToCart() {
    setState(() {
      cartQuantity++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Buku ditambahkan ke keranjang!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                '${widget.book.imageUrl}',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              widget.book.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              "Oleh ${widget.book.author}",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 10),
            Text(
              widget.book.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Harga: Rp ${widget.book.price.toInt()}",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "Jumlah di Keranjang: $cartQuantity",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _addToCart,
                child: Text("Tambahkan ke Keranjang"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
