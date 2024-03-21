import 'package:flutter/material.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    Widget riwayat() => Card(
          // margin: EdgeInsets.zero,
          child: Row(
            children: [
              /*AspectRatio(
                  aspectRatio: 1,
                  child: Container(color: Colors.grey),
                ),*/
              Container(
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: 100,
              ),
              Container(
                height: 100,
                // color: Colors.red,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Latte cafe', style: TextStyle(fontWeight: FontWeight.bold, color: primary)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.orange),
                          child: const Text('proses', style: TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text('Rp 60.000', style: TextStyle(fontSize: 10, color: primary)),
                    const SizedBox(height: 5),
                    const Text('3 Pesanan', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.red,
                  padding: const EdgeInsets.all(10),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('22/12/2023', style: TextStyle(fontSize: 10)),
                      Text(
                        'Driver Telah Tiba di Tujuan',
                        style: TextStyle(color: primary),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        elevation: 1,
        title: const Text('Riwayat Order', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: primary,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        child: Container(
          height: tinggi(context),
          width: lebar(context),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Column(
              children: [
                riwayat(),
                riwayat(),
                riwayat(),
                riwayat(),
                //
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
