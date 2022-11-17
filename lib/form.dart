import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final judul = <String>[];
final nominal = <int>[];
final tipe = <String>[];

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String _tipe = "Pilih Judul";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Budget'),
      ),
      drawer: const AppDrawer(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Bayar Go-Car",
                    labelText: "Judul",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 100000",
                    labelText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (value != null && value.isNotEmpty) {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (value != null && value.isNotEmpty) {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                items: <String>['Pemasukan', 'Pengeluaran']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _tipe = value!;
                  });
                },
                hint: Text(_tipe),
              )),
              const Spacer(),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _tipe != "Pilih Judul") {
                    judul.add(_judul);
                    nominal.add(_nominal);
                    tipe.add(_tipe);
                  }
                },
                child: const Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyDataPage extends StatefulWidget {
  const MyDataPage({super.key});

  @override
  State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tipe.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              title: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    judul[index],
                    style: const TextStyle(fontSize: 25),
                  )),
              subtitle: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${nominal[index]}",
                        style: TextStyle(color: Colors.black.withOpacity(1.0)),
                      ),
                      Text(
                        tipe[index],
                        style: TextStyle(color: Colors.black.withOpacity(1.0)),
                      ),
                    ],
                  )),
            ));
          }),
    );
  }
}
