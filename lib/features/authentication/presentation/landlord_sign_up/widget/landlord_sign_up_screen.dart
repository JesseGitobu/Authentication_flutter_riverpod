import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/background_widget.dart';
import 'components/i_have_an_account.dart';
import 'components/registration_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ScreenContent(context),
        ),
      ),
    );
  }

  Widget ScreenContent(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    Widget Background = CustomPaint(
      size: Size(
          WIDTH,
          (WIDTH * 2.163551401869159)
              .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
      painter: RPSCustomPainter(),
    );
    Widget Logo = Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/smart1.jpeg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
    Widget AppTitle = Container(
      width: 230,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: Text(
          'SMART ESTATE',
          style: TextStyle(
              color: HexColor("#927F19"),
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
              fontFamily: 'Roboto Serif',
              fontSize: 24),
        ),
      ),
    );

    return Stack(children: [
      Background,
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Logo,
            ),
            SizedBox(
              height: WIDTH / 12,
            ),
            AppTitle,
            SizedBox(
              height: WIDTH / 15,
            ),
            Container(
                height: 423,
                width: 330,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white,
                ),
                child: const RegistrationForm()),
            const Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: IHaveAnAccount()),
          ],
        ),
      ),
    ]);
  }
}
