import 'package:fitfoxie/pages/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaloriasForm extends StatelessWidget {
  final TextEditingController alturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController atividadeController = TextEditingController();
  final TextEditingController generoController = TextEditingController();
  double imc;

  CaloriasForm({required this.imc});

  void calcularCalorias(BuildContext context) {
    final double? altura = double.tryParse(alturaController.text);
    final double? peso = double.tryParse(pesoController.text);
    final int? idade = int.tryParse(idadeController.text);
    final String atividade = atividadeController.text;
    final String genero = generoController.text;

    final Map<String, double> fatores = {
      'Sedentário': 1.2,
      'Levemente ativo': 1.375,
      'Moderadamente ativo': 1.55,
      'Muito ativo': 1.725,
      'Extremamente ativo': 1.9,
    };

    if (altura != null &&
        peso != null &&
        idade != null &&
        fatores.containsKey(atividade) &&
        (genero == 'Masculino' || genero == 'Feminino')) {
      double tmb;

      if (genero == 'Masculino') {
        tmb = 66 + (13.7 * peso) + (5 * altura) - (6.8 * idade);
      } else {
        tmb = 655 + (9.6 * peso) + (1.8 * altura) - (4.7 * idade);
      }

      final calorias =
          (tmb * fatores[atividade]!).round(); // arredonda para inteiro

      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Resultado'),
              content: Text(
                'Você precisa de aproximadamente $calorias calorias por dia para manter seu peso atual.',
              ),
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
        MaterialPageRoute(
          builder:
              (context) => Results(imc: imc, calorias: calorias.toDouble()),
        ),
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
            Image.asset('images/frutineas.png', height: 100),

            Text(
              'Calculadora de Calorias',
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextField(
              controller: idadeController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                labelText: 'Idade',
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

            DropdownButtonFormField<String>(
              value: null, // ou uma opção padrão, se quiser
              items:
                  [
                    'Sedentário',
                    'Levemente ativo',
                    'Moderadamente ativo',
                    'Muito ativo',
                    'Extremamente ativo',
                  ].map((atividade) {
                    return DropdownMenuItem(
                      value: atividade,
                      child: Text(
                        atividade,
                        style: GoogleFonts.robotoMono(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                atividadeController.text = value ?? '';
              },
              decoration: InputDecoration(
                labelText: 'Nível de atividade',
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
              dropdownColor: Theme.of(context).colorScheme.surface,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 20,
              ),
            ),

            DropdownButtonFormField<String>(
              value: null, // ou uma opção padrão, se quiser
              items:
                  ['Feminino', 'Masculino'].map((genero) {
                    return DropdownMenuItem(
                      value: genero,
                      child: Text(
                        genero,
                        style: GoogleFonts.robotoMono(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                generoController.text = value ?? '';
              },
              decoration: InputDecoration(
                labelText: 'Gênero',
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
              dropdownColor: Theme.of(context).colorScheme.surface,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 20,
              ),
            ),

            Center(
              child: TextButton(
                onPressed: () => calcularCalorias(context),
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
