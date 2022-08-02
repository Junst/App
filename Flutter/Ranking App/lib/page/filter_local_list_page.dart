import 'package:myapp/data/record.dart';
import 'package:myapp/main.dart';
import 'package:myapp/model/record.dart';
import 'package:myapp/widget/search_widget.dart';
import 'package:flutter/material.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  late List<Record> records;
  String query = '';

  @override
  void initState() {
    super.initState();

    records = allRecords;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[200],
          title: Text("Search"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  final record = records[index];

                  return buildRecord(record);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Record',
        onChanged: searchRecord,
      );

  Widget buildRecord(Record record) => ListTile(
        // leading: Image.network(
        //   record.img,
        //   fit: BoxFit.cover,
        //   width: 50,
        //   height: 50,
        // ),
        title: Text(record.name),
        subtitle: Text(record.describe),
      );

  void searchRecord(String query) {
    final records = allRecords.where((record) {
      final titleLower = record.name.toLowerCase();
      final describeLower = record.describe.toLowerCase();
      final idLower = record.id.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          idLower.contains(searchLower) ||
      describeLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.records = records;
    });
  }
}
