import 'package:flutter/material.dart';
import 'package:rolmif_customer/service/color.dart';

class TukarPoin extends StatelessWidget {
  const TukarPoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Tukar Poin'),
      ),
      body: Container(
        child: Center(
          child: Text('Tukar Poin'),
        ),
      ),
    );
  }
}
