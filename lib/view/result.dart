import 'package:examen/themes/color_schema.dart';
import 'package:examen/widgets/factura_detail_row.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String total = args['total']!;
    final String totalPaltos = args['totalPaltos']!;
    final String totalLimones = args['totalLimones']!;
    final String totalChirimollos = args['totalChirimollos']!;

    final String descPaltos = args['descPaltos']!;
    final String descLimones = args['descLimones']!;
    final String descChirimollos = args['descChirimollos']!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: Card(
        elevation: 4,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Factura",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: TerracottaColors.orange,
                  ),
                ),
              ),

              Divider(height: 24),

              FacturaDetailRow(
                label: "Paltos",
                value: "\$${totalPaltos + "   " + descPaltos}",
              ),
              SizedBox(height: 12,),

              FacturaDetailRow(
                label: "Limones",
                value: "\$${totalLimones + "   " + descLimones}",
              ),
              SizedBox(height: 12,),

              FacturaDetailRow(
                label: "Chirimollos",
                value: "\$${totalChirimollos + "   " + descChirimollos}",
              ),

              Divider(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: TerracottaColors.orange,
                    ),
                  ),
                  Text(
                    "\$${total}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

