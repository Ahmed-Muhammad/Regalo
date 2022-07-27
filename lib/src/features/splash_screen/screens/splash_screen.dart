import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mercado/src/core/shared/components.dart';
import 'package:mercado/src/features/login_page/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    fadingAnimation = Tween<double>(begin: .5, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    navigateAndFinish(context, pageName: const LoginPage(), 5);
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset('assets/images/splash.png'),
            const Spacer(),
            FadeTransition(
              opacity: fadingAnimation!,
              child: Text.rich(TextSpan(
                  text: 'M ',
                  style: GoogleFonts.alegreya(
                    color: const Color.fromRGBO(196, 228, 57, 100),
                    fontSize: 70,
                    fontWeight: FontWeight.w900,
                  ),
                  children: [
                    TextSpan(
                      text: 'e r c a d o',
                      style: GoogleFonts.alegreya(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ])),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
