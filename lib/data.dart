class Item {
  Item({required this.name, required this.price, required this.asset});

  final String name;
  final int price;
  final String asset;
}

final items = [
  Item(name: 'Soap', price: 30, asset: 'assets/soap.png'),
  Item(name: 'Sanitizer', price: 50, asset: 'assets/sanitizer.png'),
  Item(name: 'Burger', price: 200, asset: 'assets/burger.png'),
  Item(name: 'Salad', price: 100, asset: 'assets/salad.png'),
];
