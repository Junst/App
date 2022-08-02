import 'package:flutter/material.dart';
import 'package:myapp/Search/data/data_model.dart';
import 'package:myapp/Search/presentation/screens/record_details_page.dart';

class RecordTile extends StatelessWidget {
  final Record record;

  RecordTile({required this.record});

  String recordTitle() {
    String title = "";
    if (record.popular! >5) {
      title = "Hot";
    } else if (record.popular! <=5) {
      title = "Rare";
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: record.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(record.image),
              ),
            ),
            title: Text('${recordTitle()} ${record.name}'),
            subtitle: Text(record.name),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecordDetailsPage(record: record)));
            },
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
