import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolmif_customer/page/login.dart';
import 'package:rolmif_customer/service/color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final title = [
      'Alamat Tersimpan',
      'Pembayaran',
      'Pusat Bantuan',
      'Pengaturan',
      'Panduan Layanan',
      'Kebijakan Privasi',
      'Panduan Aplikasi',
    ];
    Widget sosmed(String image, dynamic page) =>
        InkWell(
          onTap: () {
            page == null
                ? null
                : Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => page),
            );
          },
          child: SvgPicture.asset(height: 30, width: 30, image,),
        );

    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: 150.0,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                // titlePadding: EdgeInsets.zero,
                title: Container(
                  // color: Colors.red,
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                            image: const DecorationImage(image: AssetImage('assets/caffee.png'), fit: BoxFit.cover),
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Fauzi Zaelano', style: TextStyle(fontWeight: FontWeight.bold)),
                            const Text(
                              '@fauzizaelano',
                              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: title.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {},
                              child: Card(
                                elevation: 1,
                                // margin: const EdgeInsets.symmetric(vertical: 2),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(title[index]),
                                      const Icon(Icons.navigate_next_rounded),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Card(
                        elevation: 1,
                        // margin: const EdgeInsets.symmetric(vertical: 2),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Media Sosial'),
                              Row(
                                children: [
                                  SvgPicture.asset(height: 30, width: 30, 'assets/instagram.svg'),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(height: 30, width: 30, 'assets/facebook.svg'),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(height: 30, width: 30, 'assets/youtube.svg'),
                                  const SizedBox(width: 10),
                                  SvgPicture.asset(height: 30, width: 30, 'assets/twitter.svg'),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 100, top: 70),
                        padding: const EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Logout', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
                                  },
                                  icon: const Icon(Icons.logout_rounded, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
