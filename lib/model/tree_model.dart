import 'tree_type.dart';

class TreeModel {
  final TreeType tree;
  int quantity;

  TreeModel({required this.tree, this.quantity = 0});

  double get subtotal => tree.price * quantity;

  double get discount {
    if (quantity >= 100 && quantity <= 300) {
      return tree.discountMid;
    } else if (quantity > 300) {
      return tree.discountHigh;
    }
    return 0;
  }

  double get total {
    double subtotalValue = subtotal;
    double discountValue = subtotalValue * discount;
    return subtotalValue - discountValue;
  }

  String get discountLabel {
    if (discount == 0) return "Sin descuento";
    return "Descuento: ${(discount * 100).toStringAsFixed(0)}%";
  }
}