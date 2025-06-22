import 'package:fitfoxie/widgets/caloriasDefault.dart';
import 'package:fitfoxie/widgets/caloriasResult.dart';
import 'package:fitfoxie/widgets/imcDefault.dart';
import 'package:fitfoxie/widgets/imcResult.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatelessWidget {
  double imc;
  double calorias;

  Results({required this.imc, required this.calorias});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  child: Image.asset("images/raposinea.png"),
                ),
                Text(
                  "Resultados",
                  style: GoogleFonts.robotoMono(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            Container(
              child: imc <= 0 ? Imcdefault(calorias: calorias,) : Imcresult(resultadoImc: imc),
            ),
            Container(
              child:
                  calorias <= 0
                      ? Caloriasdefault(imc: imc,)
                      : Caloriasresult(resultadoCalorias: calorias),
            ),
          ],
        ),
      ),
    );
  }
}
