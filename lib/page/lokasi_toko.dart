import 'package:flutter/material.dart';
import 'package:rolmif_customer/service/color.dart';

class LokasiToko extends StatelessWidget {
  const LokasiToko({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Lokasi Toko'),
      ),
      body: Container(
        child: Center(
          child: Text('Lokasi Toko'),
        ),
      ),
    );
  }
}
