import 'package:examen/model/tree_model.dart';
import 'package:examen/model/tree_type.dart';

class TreeController{
  final List<TreeModel> selectedTrees = [
    for(var t in TreeType.values)
      TreeModel(tree: t)
  ];

  int get totalQuantity {
    int totalQty = 0;
    for (var tree in selectedTrees) {
      totalQty += tree.quantity;
    }
    return totalQty;
  }

  double get subtotal {
    double treeTotal = 0;
    for (var tree in selectedTrees) {
      treeTotal += tree.total;
    }
    return treeTotal;
  }

  double get globalDiscount {
    if (totalQuantity >= 1000) {
      return 0.15;
    }
    return 0.0;
  }

  double get noIva {
    final subtotalValue = subtotal;
    final discountValue = subtotalValue * globalDiscount;
    return subtotalValue - discountValue;
  }

  double get extraIva {
    final charge = noIva;
    return charge * 0.15;
  }

  double get total {
    return noIva + extraIva;
  }

  String allTreesZero() {
    for(int i=0; i<selectedTrees.length; i++){
      if(selectedTrees[i].quantity != 0) {
        return "";
      }
    }

    return "Agregue por lo menos un arbol";
  }
}