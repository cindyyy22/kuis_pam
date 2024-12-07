import 'package:flutter/material.dart';

class DetailOrderPage extends StatefulWidget {
  final String name;
  final int price;
  const DetailOrderPage({super.key, required this.name, required this.price});

  @override
  _DetailOrderPageState createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  final TextEditingController _quantityController = TextEditingController();
  int totalPrice = 0;

  void _calculateTotalPrice() {
    setState(() {
      int quantity = int.tryParse(_quantityController.text) ?? 0;
      totalPrice = widget.price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Order')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/noodle.jpg', height: 150),
            const SizedBox(height: 10),
            Text(widget.name, style: const TextStyle(fontSize: 20)),
            Text('Rp ${widget.price}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Jumlah Pesanan'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTotalPrice,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 10),
            Text('Total Harga: Rp $totalPrice', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
