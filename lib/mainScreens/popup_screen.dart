import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../route/app_route.dart';

class PopupScreen extends StatefulWidget {
  const PopupScreen({super.key});

  @override
  State<PopupScreen> createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,

          children: [

            ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.05,
              numberOfParticles: 25,
              gravity: 0.3,
              colors: const [
                Colors.red,
                Colors.green,
                Colors.blue,
                Colors.orange,
                Colors.pink,
              ],
            ),
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    CircleAvatar(radius: 50,backgroundColor: Color(0xffEF2A39),
                      child: Image.asset(
                        'assets/popUp/true.png',
                        width: 34,
                        height:34,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "Success !",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffef2a39),
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      "Your payment was successful.",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                    Text(
                      "A receipt for this purchase has",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                    Text(
                      "been sent to your email.",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(height: 36,),
                    GestureDetector(
                      onTap: (){
                        appRoute.go('/HomeScreen');

                      },

                      child: Container(
                        height: 42,
                        width: 160,
                        decoration: BoxDecoration(
                            color: Color(0xffEF2A39),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(child: Text("Go Back",style: GoogleFonts.roboto(fontWeight: FontWeight.w600,color: Colors.white),),),
                      ),
                    ) ],

                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
