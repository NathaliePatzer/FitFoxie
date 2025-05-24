import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 120,
              width: 120,
              child: Image.asset("images/rostoraposinea.png"),
            ),
            Text("FitFoxie", 
            style: GoogleFonts.robotoMono(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 35
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 70),
              child: Text("Boas-vindas serumaninho! A raposinha mais saudável do pedaço vai te ajudar a cuidar do seu corpinho com carinho.", 
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoMono(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 18,
              )),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/results");
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.primary),
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )
                  ),
                  overlayColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
              ),
              child: Text("Bora lá!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inverseSurface,
                fontSize: 22),
              ),
            )
          ],
        ),
      ),
    );
  }
}