import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Get start to shop your groceries',
            style: GoogleFonts.sansita(
              textStyle: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  letterSpacing: 2),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            },
            child: Text(
              'explore',
              style: GoogleFonts.sansita(
                textStyle: TextStyle(fontSize: 16, letterSpacing: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
