import 'package:flutter/material.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:counter_7/page/mywatchlist_detail.dart';
import 'package:counter_7/page/mywatchlist_fetch.dart';

class MywatchlistPage extends StatefulWidget {
  const MywatchlistPage({Key? key}) : super(key: key);

  @override
  _MywatchlistPageState createState() => _MywatchlistPageState();
}

class _MywatchlistPageState extends State<MywatchlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
        drawer: const AppDrawer(),
        body: FutureBuilder(
            future: fetchMywatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada my watch list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: snapshot.data![index].fields.watched
                                        ? Colors.blue
                                        : Colors.red)),
                            child: ListTile(
                              title:
                                  Text("${snapshot.data![index].fields.title}"),
                              trailing: Checkbox(
                                checkColor: Colors.white,
                                value: snapshot.data![index].fields.watched,
                                onChanged: (bool? value) {
                                  setState(() {
                                    snapshot.data![index].fields.watched =
                                        value!;
                                  });
                                },
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MywatchlistDetail(
                                          fields:
                                              snapshot.data![index].fields)),
                                );
                              },
                            ),
                          ));
                }
              }
            }));
  }
}
