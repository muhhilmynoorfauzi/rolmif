import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolmif_customer/page/login.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';

class Introduction extends StatelessWidget {
  const Introduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: Stack(
        children: [
          Container(
            height: tinggi(context),
            width: lebar(context),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/bg1.png'), fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: SvgPicture.asset('assets/logo2.svg', color: primary, fit: BoxFit.fitWidth),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    width: lebar(context),
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(image: AssetImage('assets/char1.png'), fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        // color: Colors.red,
        height: 123,
        width: lebar(context),
        child: Stack(
          children: [
            Transform.rotate(
              angle: 3.14159265, // Ini setara dengan 180 derajat dalam radian
              child: SvgPicture.asset(width: lebar(context), 'assets/bg2.svg', color: secondary, fit: BoxFit.fitWidth),
            ),
            Center(
              child: Container(
                // color: Colors.red,
                margin: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Text(
                              'Lanjut',
                              style: TextStyle(color: primary, fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: primary),
                              child: const Icon(Icons.navigate_next_rounded, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
