import 'package:fitfoxie/pages/imcForm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Imcdefault extends StatelessWidget {
  double calorias;
  Imcdefault({required this.calorias});

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
            margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Text(
              "IMC",
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
              "Hmmm... A FitFoxie ainda não farejou seus dados! Bora calcular esse IMC?",
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 14,
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            ImcForm(calorias: calorias),
                  ),
                );
              },
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
                "Vamos!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
