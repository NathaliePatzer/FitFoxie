import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Caloriasresult extends StatelessWidget {
  final double resultadoCalorias;

  const Caloriasresult({super.key, required this.resultadoCalorias});

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
            margin: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 10),
            child: Text(
              "Calorias",
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 15),
            child: Text(
              ("${resultadoCalorias.toString()} kcal/dia"),
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 20),
            child: Text(
              "Estimativa de necessidade calórica",
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
