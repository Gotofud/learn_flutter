import 'package:flutter/material.dart';
import 'package:learn_flutter/latihan/ulangan_hotel/hotelPay.dart';

class HotelDetail extends StatefulWidget {
  final Map<String, String> detail;

  const HotelDetail({
    super.key,
    required this.detail,
  });

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hariController = TextEditingController();
  final TextEditingController tglPenginapanController = TextEditingController();
  // final TextEditingController uangController = TextEditingController();

  late int hargaPaket;
  int totalHarga = 0;
  int sisa = 0;

  @override
  void initState() {
    super.initState();
    hargaPaket = int.tryParse((widget.detail['hargaPermalam'] ?? '0')
            .replaceAll(RegExp(r'[^0-9]'), '')) ??
        0;
  }

  // void hitungTotal() {
  //   int hari = int.tryParse(hariController.text) ?? 0;
  //   int uang = int.tryParse(uangController.text) ?? 0;

  //   setState(() {
  //     totalHarga = hari * hargaPaket;
  //     sisa = uang - totalHarga;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.detail['nama'] ?? 'Detail')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                widget.detail['img'] ?? '',
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(widget.detail['nama'] ?? '',
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Rp',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(widget.detail['hargaPermalam'] ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(width: 20),
                Text(
                  '-',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                Text(widget.detail['bintang'] ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 40),
            Text(
              'Fasilitas',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.detail['fasilitas'] ?? '',
              style:
                  const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
            const Divider(height: 40),
            const Text(
              "Formulir Pemesanan Kamar",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: tglPenginapanController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Tanggal Penginapan",
              ),
              validator: (value) {
                if (value!.isEmpty) return "Input Tanggal Penginapan";
                return null;
              },
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    tglPenginapanController.text =
                        "${picked.year}-${picked.month}-${picked.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: hariController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Hari Penginapan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelPay(
                      nama: namaController.text,
                      tglPenginapan: tglPenginapanController.text,
                      hari: hariController.text,
                      detail: widget.detail, // TAMBAHKAN INI
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("Pesan"),
            )
          ],
        ),
      ),
    );
  }
}