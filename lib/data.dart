import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/form.dart';

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
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${nominal[index]}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(1.0)),
                            ),
                            Text(
                              tipe[index],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(1.0)),
                            ),
                          ],
                        ),
                        Text(datetime[index])
                      ]),
                    )));
          }),
    );
  }
}
