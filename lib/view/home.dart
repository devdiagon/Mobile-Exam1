import 'package:examen/controller/tree_controller.dart';
import 'package:examen/model/tree_model.dart';
import 'package:examen/widgets/error_mesage.dart';
import 'package:examen/widgets/tree_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final treeCtrl = TreeController();
  final TextEditingController paltoController = TextEditingController();
  final TextEditingController limonController = TextEditingController();
  final TextEditingController chirimoyoController = TextEditingController();

  String totalPaltos = "0.00";
  String totalLimones = "0.00";
  String totalChirimollos = "0.00";
  String totalGeneral = "0.00";
  String _errMsg = "";

  void _computeAlltrees() {
    setState(() {
      _errMsg = "";

      final paltoQty = int.tryParse(paltoController.text);
      final limonQty = int.tryParse(limonController.text);
      final chirimoyoQty = int.tryParse(chirimoyoController.text);

      if (paltoQty == null || limonQty == null || chirimoyoQty == null) {
        _errMsg = "Ingrese solo números válidos en todos los campos";
        return;
      }

      if (paltoQty < 0 || limonQty < 0 || chirimoyoQty < 0) {
        _errMsg = "Las cantidades no pueden ser negativas";
        return;
      }

      treeCtrl.selectedTrees[0].quantity = paltoQty;
      treeCtrl.selectedTrees[1].quantity = limonQty;
      treeCtrl.selectedTrees[2].quantity = chirimoyoQty;

      totalPaltos = treeCtrl.selectedTrees[0].total.toStringAsFixed(2);
      totalLimones = treeCtrl.selectedTrees[1].total.toStringAsFixed(2);
      totalChirimollos = treeCtrl.selectedTrees[2].total.toStringAsFixed(2);
      totalGeneral = treeCtrl.total.toStringAsFixed(2);

      _errMsg = treeCtrl.allTreesZero();

      if(_errMsg != "") {
        return;
      }

      Navigator.pushNamed(
          context, "/result",
          arguments: {
            'total': totalGeneral,
            'totalPaltos': totalPaltos,
            'descPaltos': treeCtrl.selectedTrees[0].discountLabel,
            'totalLimones': totalLimones,
            'descLimones': treeCtrl.selectedTrees[1].discountLabel,
            'totalChirimollos': totalChirimollos,
            'descChirimollos': treeCtrl.selectedTrees[2].discountLabel,
          }
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Árboles'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Paltos
            TextField(
              controller: paltoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cantidad de Paltos",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Limones
            TextField(
              controller: limonController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cantidad de Limones",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            // Chirimollos
            TextField(
              controller: chirimoyoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cantidad de Chirimollos",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16,),
            TreeButton(label: "Calcular Total", onPressed: _computeAlltrees),
            SizedBox(height: 16,),
            ErrorMessage(errorText: _errMsg,),
          ],
        ),
      ),
    );
  }
}
