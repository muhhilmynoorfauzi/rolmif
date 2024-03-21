import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolmif_customer/page/nav_bar.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: tinggi(context),
              width: lebar(context),
              decoration: BoxDecoration(
                color: primary,
                image: const DecorationImage(image: AssetImage('assets/bg1.png'), fit: BoxFit.cover),
              ),
            ),
            SafeArea(
              child: Container(
                height: tinggi(context) * .4,
                width: lebar(context),
                // color: Colors.red,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, left: 50, right: 50),
                      child: SvgPicture.asset('assets/logo2.svg', color: primary, fit: BoxFit.fitWidth),
                    ),
                    Expanded(child: Container()),
                    Container(
                      // height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: lebar(context),
                      // color: Colors.red,
                      child: TextField(
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: primary),
                          hintText: 'Email Address',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      // height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: lebar(context),
                      // color: Colors.red,
                      child: TextField(
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: primary),
                          hintText: 'Password',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primary),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {},
                            child: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 130,
        // color: Colors.blue,
        width: lebar(context),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
              },
              child: Container(
                height: 50,
                width: lebar(context),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: primary),
                child: const Center(
                  child: Text('Sign In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: lebar(context),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), border: Border.all(color: primary, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/google.png', height: 25, width: 25),
                    const SizedBox(width: 10),
                    Text('Lanjutkan dengan Google', style: TextStyle(color: primary)),
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
