class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

Product product1 = Product(
  name: 'Product 1',
  imageUrl: 'https://example.com/product1.jpg',
  price: 29.99,
);

List<Product> products = [
  product1,
  Product(
    name: 'Product 2',
    imageUrl: 'https://example.com/product2.jpg',
    price: 19.99,
  ),
  Product(
    name: 'Product 3',
    imageUrl: 'https://example.com/product3.jpg',
    price: 39.99,
  ),
  Product(
    name: 'Product 4',
    imageUrl: 'https://example.com/product4.jpg',
    price: 49.99,
  ),
];

abstract class HomeDataSource {
  Future<List<Product>> getHomeProducts({
    required double price,
    required String name,
  });
}

class HomeDataSourceImpl implements HomeDataSource {
  @override
  Future<List<Product>> getHomeProducts({required double price, required String name}) {
    throw UnimplementedError();
  }

}


