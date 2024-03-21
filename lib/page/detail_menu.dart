import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolmif_customer/service/color.dart';
import 'package:rolmif_customer/service/component.dart';
import 'package:rolmif_customer/service/state_manajement.dart';

int harga = 20;

class DetailMenu extends StatefulWidget {
  @override
  State<DetailMenu> createState() => _DetailMenuState();
}

class _DetailMenuState extends State<DetailMenu> {
  int hargaSatuan = harga;
  int jumlah = 1, totalHarga = harga;
  String size = 'Reguler',
      ice = 'Pilihan',
      sugar = 'Pilihan',
      expresso = 'Pilihan',
      topping = 'Pilihan',
      catatan = 'Pilihan',
      deskripsi = 'Sebuah hidangan penutup yang umumnya dibuat dari bahan-bahan yang direbus, dikukus, '
          'atau dipanggang. Istilah puding juga dapat dipakai untuk berbagai jenis pastei yang berisi '
          'campuran lemak hewan, daging, atau buah-buahan.';

  @override
  Widget build(BuildContext context) {
    var sizeCup = context.watch<Counter>().sizeCup;

//---------------------------------------------------------------------------------------------------------------------
    List<String> dataIce = [
      'Ekstra Ice',
      'Normal Ice',
      'Less Ice',
      'No Ice',
      'Hot',
    ];
    List<String> dataSugar = [
      'Ekstra Sugar',
      'Normal Sugar',
      'Less Sugar',
    ];
    List<String> dataEspresso = [
      'Ekstra Espresso',
      'Normal Espresso',
      'Less Espresso',
    ];
    List<String> dataTopping = [
      'Oreo',
      'Cream',
      'Choco Granola',
      'Milo Powder',
    ];
//---------------------------------------------------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Latte Caffee'),
        elevation: 0,
      ),
      body: SizedBox(
        height: tinggi(context),
        width: lebar(context),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: primary,
                pinned: true,
                elevation: 0,
                expandedHeight: 200,
                leadingWidth: 0,
                leading: Container(),
                toolbarHeight: 40,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1,
                  title: Container(
                    height: 40,
                    width: lebar(context),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height: 1),
                        Container(
                          height: 4,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        Container(height: 1),
                      ],
                    ),
                  ),
                  titlePadding: EdgeInsets.zero,
                  background: Image.asset(
                    'assets/caffee.png',
                    fit: BoxFit.cover,
                    height: 300,
                    width: lebar(context),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext c, int index) {
                    return Container(
                      height: tinggi(context),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Text(deskripsi, textAlign: TextAlign.justify),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 100,
                                // color: Colors.red,
                                child: const Text('Size'),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    // color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AnimatedContainer(
                                        // color: Colors.red,
                                        height: sizeCup == 0
                                            ? 180
                                            : sizeCup == 1
                                                ? 140
                                                : 100,
                                        width: 100,
                                        duration: const Duration(milliseconds: 200),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('assets/size_cafe.png'),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              context.read<Counter>().setSizeCup(index: 0);
                                              size = 'Large';
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: sizeCup == 0 ? primary : Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: sizeCup == 0 ? null : Border.all(color: primary, width: 2.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Large',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: sizeCup == 0 ? Colors.white : primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.read<Counter>().setSizeCup(index: 1);
                                              size = 'Reguler';
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: sizeCup == 1 ? primary : Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: sizeCup == 1 ? null : Border.all(color: primary, width: 2.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Reguler',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: sizeCup == 1 ? Colors.white : primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context.read<Counter>().setSizeCup(index: 2);
                                              size = 'Small';
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                color: sizeCup == 2 ? primary : Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                border: sizeCup == 2 ? null : Border.all(color: primary, width: 2.0),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Small',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: sizeCup == 2 ? Colors.white : primary,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 100,
                                // color: Colors.red,
                                child: const Text('Ice'),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DropdownButton(
                                    elevation: 1,
                                    isExpanded: true,
                                    hint: Text(ice),
                                    onChanged: (value) {
                                      ice = value!;
                                      setState(() {});
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    items: List.generate(
                                      dataIce.length,
                                      (index) => DropdownMenuItem(
                                        value: dataIce[index],
                                        child: Text(dataIce[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 100,
                                // color: Colors.red,
                                child: const Text('Sugar'),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DropdownButton(
                                    elevation: 1,
                                    isExpanded: true,
                                    hint: Text(
                                      sugar,
                                    ),
                                    onChanged: (value) {
                                      sugar = value!;
                                      setState(() {});
                                    },
                                    // dropdownColor: isLight ? white : Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    items: List.generate(
                                      dataSugar.length,
                                      (index) => DropdownMenuItem(
                                        value: dataSugar[index],
                                        child: Text(dataSugar[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 100,
                                // color: Colors.red,
                                child: const Text('Espresso'),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DropdownButton(
                                    elevation: 1,
                                    isExpanded: true,
                                    hint: Text(
                                      expresso,
                                    ),
                                    onChanged: (value) {
                                      expresso = value!;
                                      setState(() {});
                                    },
                                    // dropdownColor: isLight ? white : Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    items: List.generate(
                                      dataEspresso.length,
                                      (index) => DropdownMenuItem(
                                        value: dataEspresso[index],
                                        child: Text(dataEspresso[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                width: 100,
                                child: const Text('Topping'),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: DropdownButton(
                                    elevation: 1,
                                    isExpanded: true,
                                    hint: Text(
                                      topping,
                                    ),
                                    onChanged: (value) {
                                      topping = value!;
                                      setState(() {});
                                    },
                                    // dropdownColor: isLight ? white : Colors.grey,
                                    borderRadius: BorderRadius.circular(20),
                                    items: List.generate(
                                      dataTopping.length,
                                      (index) => DropdownMenuItem(
                                        value: dataTopping[index],
                                        child: Text(dataTopping[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            width: lebar(context),
                            child: const Text('Catatan'),
                          ),
                          Container(
                            // height: 100,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              // controller: _controller,
                              onChanged: (text) {
                                catatan = text;
                              },
                              maxLines: 4,
                              decoration: const InputDecoration(
                                hintText: 'Misal: pisahin sambalnya',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 105,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (jumlah < 1 || jumlah > 1) {
                      jumlah--;
                      totalHarga = hargaSatuan * jumlah;
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.red),
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.black.withOpacity(.1)),
                  child: Center(child: Text('$jumlah')),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    jumlah++;
                    totalHarga = hargaSatuan * jumlah;
                    setState(() {});
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.green),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 40,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: primary),
              child: Center(
                child: Text(
                  'Tambahkan ke keranjang - Rp $totalHarga.000',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
