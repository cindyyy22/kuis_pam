import 'package:flutter/material.dart';
import 'package:kuis_pam/pages/detail_order.dart';


class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hallo $username, mau makan apa?'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset('assets/images/authentication.jpg', height: 200, fit: BoxFit.cover),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _foodItem(context, 'Noodle', 20000, 'assets/images/noodle.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _foodItem(BuildContext context, String name, int price, String imageUrl) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl, width: 50),
        title: Text(name),
        subtitle: Text('Rp $price'),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailOrderPage(name: name, price: price)),
            );
          },
          child: const Text('Beli'),
        ),
      ),
    );
  }
}
