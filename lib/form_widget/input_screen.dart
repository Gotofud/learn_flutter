import 'package:flutter/material.dart';
import 'package:learn_flutter/form_widget/output_screen.dart';
import 'package:learn_flutter/main_layout.dart';

class InputFormScreen extends StatefulWidget {
  const InputFormScreen({super.key});

  @override
  State<InputFormScreen> createState() => _InputFormScreenState();
}

class _InputFormScreenState extends State<InputFormScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController tglLahirController = TextEditingController();

  String _jk = "";
  String _agama = "";
  String? _error;

  final List<String> agama = [
    "Islam",
    "Kristen",
    "Katolik",
    "Hindu",
    "Buddha",
    "Konghucu",
  ];

  @override
  void initState() {
    super.initState();
    tglLahirController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: "Input Form",
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Formulir Biodata",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Input Nama";
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jenis Kelamin",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio<String>(
                      value: "Laki-laki",
                      groupValue: _jk,
                      onChanged: (val) {
                        setState(() {
                          _jk = val!;
                          _error = null;
                        });
                      },
                    ),
                    const Text("Laki-laki"),
                    Radio<String>(
                      value: "Perempuan",
                      groupValue: _jk,
                      onChanged: (val) {
                        setState(() {
                          _jk = val!;
                          _error = null;
                        });
                      },
                    ),
                    const Text("Perempuan"),
                  ],
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      _error!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: tglLahirController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Tanggal Lahir",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Input Tanggal Lahir";
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
                        tglLahirController.text =
                            "${picked.year}-${picked.month}-${picked.day}";
                      });
                    }
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  value: _agama.isEmpty ? null : _agama,
                  hint: Text("Pilih Agama"),
                  items: agama
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _agama = value!;
                    });
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_jk.isEmpty) {
                      setState(() => _error = "Pilih jenis kelamin");
                    }

                    if (!_formKey.currentState!.validate()) return;
                    if (_jk.isEmpty || _agama.isEmpty) return;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OutputFormScreen(
                          nama: _nameController.text,
                          jk: _jk,
                          tglLahir: tglLahirController.text,
                          agama: _agama,
                        ),
                      ),
                    );
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
