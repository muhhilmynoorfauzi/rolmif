import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rolmif_customer/page/detail_menu.dart';
import 'package:rolmif_customer/page/lokasi_toko.dart';
import 'package:rolmif_customer/page/tukar_poin.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';
import 'package:rolmif_customer/service/state_manajement.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var categories = context.watch<Counter>().categories;
    var loading = context.watch<Counter>().loading;
    // Menghitung crossAxisCount berdasarkan lebar layar dan lebar item (200)
    int crossAxisCount = (lebar(context) / 200).floor();

    List<String> menu = ['All', 'Sayuran', 'Kopi', 'non-Kopi', 'Milk', 'Pudding'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child: SvgPicture.asset('assets/logo2.svg', width: 200, color: primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, color: primary),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 500,
                width: lebar(context),
                // color: Colors.red,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SvgPicture.asset(
                            width: lebar(context),
                            'assets/bg2.svg',
                            color: secondary,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 80),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              const Text('Welcome ', style: TextStyle(fontSize: 25, color: Colors.white)),
                              Text(
                                'Fauzi $crossAxisCount',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                          child: const Text('@fauzizaelano'),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: Container(
                                height: 80,
                                width: lebar(context) * .45,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '2 poin',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: primary),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => const TukarPoin()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration:
                                            BoxDecoration(color: primary, borderRadius: BorderRadius.circular(5)),
                                        child: const Text(
                                          'Tukar Poin',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                              elevation: 3,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LokasiToko()));
                                },
                                child: Container(
                                  height: 80,
                                  width: lebar(context) * .45,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration:
                                            BoxDecoration(color: primary, borderRadius: BorderRadius.circular(50)),
                                        child: const Icon(Icons.location_on, color: Colors.white),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text('Lokasi Toko', style: TextStyle(fontWeight: FontWeight.bold)),
                                            Text(
                                              'Waimital,Kec. Kairatu, Kabupaten Seram Bagian Barat, Maluku',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            'Menu Favorite',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 210,
                          margin: const EdgeInsets.only(bottom: 5),
                          width: lebar(context),
                          // color: Colors.red,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: 4,
                            padding: const EdgeInsets.only(left: 10),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: secondary.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset('assets/pudding.png'),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(left: 10),
                                              child: const Text(
                                                'Menu Favorite',
                                                style: TextStyle(
                                                    color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Container(
                                              margin: const EdgeInsets.only(left: 10),
                                              child: const Text(
                                                'Menu Favorite',
                                                style: TextStyle(color: Colors.black, fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              StickyHeader(
                header: Container(
                  height: 50,
                  width: lebar(context),
                  color: Colors.white,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: menu.length,
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        elevation: index == categories ? 3 : 0,
                        child: InkWell(
                          onTap: () async {
                            context.read<Counter>().goCategories(index: index);
                            context.read<Counter>().setLoading(true);
                            await Future.delayed(const Duration(milliseconds: 500));
                            context.read<Counter>().setLoading(false);
                          },
                          child: Container(
                            // width: 80,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: secondary.withOpacity(index == categories ? 1 : .5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text(menu[index])),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                content: Column(
                  children: [
                    (loading)
                        ? Container(
                            height: tinggi(context),
                            alignment: Alignment.topCenter,
                            padding: const EdgeInsets.all(10),
                            child: const CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount, childAspectRatio: 1 / 1),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMenu()));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10), color: secondary.withOpacity(.5)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/caffee.png',
                                          height: 130,
                                          width: double.infinity,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Text('Latte Caffee', style: TextStyle(fontWeight: FontWeight.bold)),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 8),
                                        child: Text('Rp. 20.000'),
                                      ),
                                      const SizedBox(height: 5)
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
