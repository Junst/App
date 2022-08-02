import 'package:flutter/material.dart';
import 'package:myapp/Search/data/data_model.dart';
import 'package:url_launcher/url_launcher.dart';
class RecordDetailsPage extends StatelessWidget {

  final Record record;

  RecordDetailsPage({required this.record});

  String recordTitle() {
    String title = "";
    if (record.popular! >5) {
      title = "Hot";
    } else if (record.popular! <=5) {
      title = "Rare";
    }
    return title;
  }

  void customLaunch(command) async{
    if(await canLaunch(command)){
      await launch(command);
    }else{
      print('Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${recordTitle()} ${record.name}'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: Hero(
                tag: record.id,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(record.image),
                  radius: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Text(
              '${recordTitle()} ${record.name} ',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              '${record.describe}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${record.challenger}', //https://stackoverflow.com/questions/68043275/printing-int-value-in-text-widget-flutter
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20.0),
                  child: Text(
                    '${record.popular}',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
