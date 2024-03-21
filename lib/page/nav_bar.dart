import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rolmif_customer/page/home.dart';
import 'package:rolmif_customer/page/keranjang.dart';
import 'package:rolmif_customer/page/order.dart';
import 'package:rolmif_customer/page/profile.dart';
import 'package:rolmif_customer/page/voucher.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';
import 'package:rolmif_customer/service/state_manajement.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    super.initState();
    context.read<Counter>().goTo(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    var pageIndex = context.watch<Counter>().pageIndex;
    final screen = [
      Home(),
      Voucher(),
      Keranjang(),
      Order(),
      Profile(),
    ];

    Widget btnButtomSecundery(int index, IconData icon, String title) => Expanded(
          child: InkWell(
            onTap: () => context.read<Counter>().goTo(index: index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: pageIndex == index ? Colors.white : Colors.white.withOpacity(.5), size: 25),
                Text(
                  title,
                  style: TextStyle(color: pageIndex == index ? Colors.white : Colors.white.withOpacity(.5), fontSize: 13),
                )
              ],
            ),
          ),
        );

    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      extendBody: true,
      body: screen[pageIndex],
      bottomNavigationBar: Container(
        height: 80,
        width: lebar(context),
        child: Stack(
          children: [
            Center(child: SvgPicture.asset(height: 80, 'assets/navbar.svg', color: primary, fit: BoxFit.fitHeight)),
            Container(
              height: 80,
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  btnButtomSecundery(0, Icons.home, 'Home'),
                  btnButtomSecundery(1, Icons.local_offer, 'Voucher'),
                  Expanded(child: Container()),
                  btnButtomSecundery(3, Icons.assignment, 'Order'),
                  btnButtomSecundery(4, Icons.account_circle, 'Profile'),
                ],
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  context.read<Counter>().goTo(index: 2);
                },
                child: SvgPicture.asset(
                  height: 65,
                  width: 65,
                  'assets/logo1.svg',
                  color: pageIndex == 2 ? Colors.white : Colors.white.withOpacity(.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
