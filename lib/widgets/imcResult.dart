import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Imcresult extends StatelessWidget {
  final double resultadoImc;

  const Imcresult({super.key, required this.resultadoImc});

  static const descricao = [
    "Abaixo do peso",
    "Peso normal",
    "Acima do peso",
    "Obesidade grau I",
    "Obesidade grau II",
  ];

  String obterDescricaoImc(double imc) {
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc < 25) {
      return "Peso normal";
    } else if (imc < 30) {
      return "Acima do peso";
    } else if (imc < 35) {
      return "Obesidade grau I";
    } else {
      return "Obesidade grau II";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 6),
            child: Text(
              "IMC Resultado",
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 8),
            child: Text(
              resultadoImc.toStringAsFixed(2),
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 15),
            child: Text(
              obterDescricaoImc(resultadoImc),
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
