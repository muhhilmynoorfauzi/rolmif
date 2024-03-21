import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';

class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  @override
  Widget build(BuildContext context) {
    Widget voucherWajib(
      String hemat,
      VoidCallback gunakan,
      dynamic selengkapnya,
    ) {
      return Container(
        height: 150,
        width: lebar(context),
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Container(
              width: 150,
              child: Stack(
                children: [
                  // Image.asset('assets/voucher1.png', fit: BoxFit.fitWidth),
                  SvgPicture.asset('assets/voucher1.svg', width: 150,),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Hemat Hingga', style: TextStyle(color: Colors.white, fontSize: 15)),
                        Text('Rp $hemat.000', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 140,
                color: secondary.withOpacity(.7),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Promo Bulanan',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: primary),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Berlaku',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          '30 Hari',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Potongan',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          'Rp 10.000',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Minimal Transaksi',
                          style: const TextStyle(fontSize: 12),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          'Rp 35.000',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            selengkapnya == null
                                ? null
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => selengkapnya),
                                  );
                          },
                          child: Container(
                            height: 25,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
                            child: Row(
                              children: [
                                const SizedBox(width: 5),
                                const Text('Selengkapnya', style: TextStyle(fontSize: 12)),
                                const SizedBox(width: 5),
                                Container(
                                  decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(40)),
                                  child: const Icon(
                                    Icons.navigate_next_rounded,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget promoSpesial(
      String head,
      String desk,
      VoidCallback gunakan,
      dynamic selengkapnya,
    ) =>
        Container(
          height: 130,
          width: lebar(context),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: secondary.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: lebar(context),
                  decoration: BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.1),
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(image: NetworkImage('link'), fit: BoxFit.cover),
                          ),
                          child: Icon(Icons.image, color: secondary, size: 50),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                head,
                                style: TextStyle(fontWeight: FontWeight.bold, color: primary, fontSize: 15),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                desk,
                                style: const TextStyle(fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.justify,
                                maxLines: 3,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: gunakan,
                      child: Container(
                        height: 25,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: const Text('Klaim Sekarang', style: TextStyle(fontSize: 12, color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        selengkapnya == null
                            ? null
                            : Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => selengkapnya),
                              );
                      },
                      child: Container(
                        height: 25,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            const SizedBox(width: 5),
                            const Text('Selengkapnya', style: TextStyle(fontSize: 12)),
                            const SizedBox(width: 5),
                            Container(
                              decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(40)),
                              child: const Icon(
                                Icons.navigate_next_rounded,
                                size: 15,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: const Text('Voucher', style: TextStyle(color: Colors.black)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        color: primary,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // wajib
              voucherWajib(
                '80',
                () {},
                null,
              ),
              const SizedBox(height: 10),
              voucherWajib(
                '150',
                () {},
                null,
              ),
              const SizedBox(height: 10),
              voucherWajib(
                '300',
                () {},
                null,
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Promo Spesial Untuk Anda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ),

              // spesial
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext build, index) {
                  return promoSpesial(
                    'Diskon 40% max IDR 15k',
                    'Jumlah voucher maksimal yang digunakan untuk order per hari adalah I voucher',
                    () {},
                    null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
