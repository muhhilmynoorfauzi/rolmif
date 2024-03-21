import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';
import 'package:rolmif_customer/service/state_manajement.dart';

class Keranjang extends StatefulWidget {
  const Keranjang({super.key});

  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  Widget pesanan() => Card(
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(5), image: const DecorationImage(image: AssetImage('assets/caffee.png'), fit: BoxFit.cover)),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(5),
                height: 60,
                // color: Colors.red,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Latte cafe',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Regular Size, Less Ice, Normal Sugar, 1 Shot, Arabica, Cincau',
                      style: TextStyle(fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Rp 20.000',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // height: 70,
              // width: 70,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(color: secondary, borderRadius: BorderRadius.circular(5)),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ],
        ),
      );

  var isbool = false;

  @override
  Widget build(BuildContext context) {
    var loading = context.watch<Counter>().loading;

    return (isbool)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 1,
              title: const Text('Keranjang Pesanan', style: TextStyle(color: Colors.black)),
            ),
            body: (loading)
                ? Column(
                    children: [
                      Expanded(child: Center(child: CircularProgressIndicator(color: primary))),
                      const SizedBox(height: 100),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          context.read<Counter>().setLoading(true);
                          await Future.delayed(const Duration(seconds: 1));
                          context.read<Counter>().setLoading(false);
                        },
                        child: Icon(
                          Icons.refresh,
                          size: 100,
                          color: primary,
                        ),
                      ),
                      Container(
                        width: lebar(context),
                        child: Center(
                          child: Text(
                            'Belum ada pesanan',
                            style: TextStyle(color: primary, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 1,
              title: const Text('Keranjang Pesanan', style: TextStyle(color: Colors.black)),
            ),
            body: RefreshIndicator(
              color: primary,
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                setState(() {});
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(color: primary, borderRadius: BorderRadius.circular(50)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 40,
                            child: const Center(child: Text('Ambil Sendiri', style: TextStyle(color: Colors.white))),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                // color: primary,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: primary)),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 40,
                            child: Center(child: Text('Diantarkan', style: TextStyle(color: primary))),
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                    // Listview
                    pesanan(),
                    pesanan(),
                    pesanan(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: primary)),
                          child: Center(child: Text('Tambah pesanan', style: TextStyle(color: primary))),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                            // width: lebar(context),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: const Center(child: Text('Alamat Pengirim', style: TextStyle(fontSize: 13))),
                          ),
                        ),
                        Transform.rotate(
                          angle: 90 * 3.1415927 / 180, // Konversi sudut dari derajat ke radian
                          child: Icon(Icons.navigation_rounded, color: primary),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                            // width: lebar(context),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: const Center(child: Text('Alamat Pengirim', style: TextStyle(fontSize: 13))),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                      width: lebar(context),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: const Text('Catatan', style: TextStyle(fontSize: 13)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                      width: lebar(context),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: const Text('Voucher', style: TextStyle(fontSize: 13)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                      width: lebar(context),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: const Text('Pembayaran', style: TextStyle(fontSize: 13)),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(color: secondary.withOpacity(.8), borderRadius: BorderRadius.circular(10)),
                      width: lebar(context),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Ringkasan pembayaran', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Kuantitas Produk', style: TextStyle(fontSize: 13)),
                              Text('3 Pesanan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total Pesanan', style: TextStyle(fontSize: 13)),
                              Text('60.000', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Biaya Pengiriman', style: TextStyle(fontSize: 13)),
                              Text('Gratis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Biaya Layanan', style: TextStyle(fontSize: 13)),
                              Text('Gratis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Biaya Tambahan untuk Restoran', style: TextStyle(fontSize: 13)),
                              Text('Gratis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(height: 1, width: lebar(context), color: Colors.black),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: primary)),
                              Text(
                                'Rp 60.000\n(Sudah termasuk pajak)',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: primary),
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 40,
                      width: lebar(context),
                      child: const Center(child: Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                    ),
                    const SizedBox(height: 100)
                  ],
                ),
              ),
            ),
          );
  }
}
