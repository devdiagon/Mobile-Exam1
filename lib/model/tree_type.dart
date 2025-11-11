import 'tree_model.dart';

enum TreeType {
  paltos('Paltos', 1200, 0.10, 0.18),
  limones('Limones', 1000, 0.125, 0.20),
  chirimollos('Chirimillos', 980, 0.145, 0.19);

  final String name;
  final double price;
  final double discountMid;
  final double discountHigh;
  const TreeType(this.name, this.price, this.discountMid, this.discountHigh);
}