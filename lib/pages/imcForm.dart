import 'package:fitfoxie/pages/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImcForm extends StatelessWidget {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  double calorias;

  ImcForm({required this.calorias});

  void calcularIMC(BuildContext context) {
    final double? altura = double.tryParse(alturaController.text);
    final double? peso = double.tryParse(pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      final imc = peso / ((altura / 100) * (altura / 100));
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Resultado'),
              content: Text('Seu IMC é ${imc.toStringAsFixed(2)}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Results(imc: imc, calorias: calorias,)),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Erro'),
              content: const Text(
                'Por favor, preencha todos os campos corretamente.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/folineas.png', height: 100),

            Text(
              'Calculadora de IMC',
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: GoogleFonts.robotoMono(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),

            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: GoogleFonts.robotoMono(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () => calcularIMC(context),
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).colorScheme.secondary,
                  ),
                  padding: WidgetStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  overlayColor: WidgetStateProperty.all<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                child: Text(
                  "Calcular",
                  style: GoogleFonts.robotoMono(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
