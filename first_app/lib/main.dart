// main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'product_details_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(), // Set HomeScreen as the initial screen
    );
  }
}

// home_screen.dart
import 'package:flutter/material.dart';
import 'product_details_screen.dart'; // Import the product details screen

class HomeScreen extends StatelessWidget {
  final List<String> products = ['pixel 1', 'laptop', 'tablet' , 'pen drive']; // Example list of products

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            onTap: () {
              // Navigate to product details screen when tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsScreen(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// product_details_screen.dart
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Product Details for $product',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the home screen
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
