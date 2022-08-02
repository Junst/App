import 'package:flutter/material.dart';
import 'package:myapp/Search/data/data_model.dart';
import 'package:myapp/Search/domain/repository.dart';
import 'package:myapp/Search/presentation/components/loading_widget.dart';
import 'package:myapp/Search/presentation/components/user_tile.dart';
import 'package:myapp/Search/presentation/components/record_tile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Record> _records = <Record>[];
  List<Record> _recordsDisplay = <Record>[];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRecords().then((value) {
      setState(() {
        _isLoading = false;
        _records.addAll(value);
        _recordsDisplay = _records;
        print(_recordsDisplay.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Record List'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            itemBuilder: (context, index) {
              if (!_isLoading) {
                return index == 0 ? _searchBar() : RecordTile(record: this._recordsDisplay[index - 1]);
              } else {
                return LoadingView();
              }
            },
            itemCount: _recordsDisplay.length + 1,
          ),
        ),
      ),
    );
  }

  _searchBar() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: TextField(
        autofocus: false,
        onChanged: (searchText) {
          searchText = searchText.toLowerCase();
          setState(() {
            _recordsDisplay = _records.where((u) {
              var Name = u.name.toLowerCase();
              return Name.contains(searchText);
            }).toList();
          });
        },
        // controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Records',
        ),
      ),
    );
  }
}
