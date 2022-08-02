import 'dart:async';

import 'package:myapp/api/records_api.dart';
import 'package:myapp/main.dart';
import 'package:myapp/model/record.dart';
import 'package:myapp/widget/search_widget.dart';
import 'package:flutter/material.dart';

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Record> records = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1000),
  }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final records = await RecordsApi.getRecords(query);

    setState(() => this.records = records);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("title"),
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

  Future searchRecord(String query) async => debounce(() async {
        final records = await RecordsApi.getRecords(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.records = records;
        });
      });

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
}
