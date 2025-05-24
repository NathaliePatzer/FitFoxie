import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Results extends StatelessWidget {
  const Results({super.key});

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
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
