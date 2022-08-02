import 'package:flutter/material.dart';
import 'package:myapp/util/recommendation.dart';
import 'package:myapp/widgets/search_card.dart';
import 'package:myapp/widgets/trending_item.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[200],
        elevation: 0.0,
        title: Text("Trending NOW!"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(),
            SizedBox(height: 20.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: Recommendation == null ? 0 : Recommendation.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = Recommendation[index];

                return TrendingItem(
                  route: restaurant["route"],
                  img: restaurant["img"],
                  title: restaurant["title"],
                  description: restaurant["description"],
                  rating: restaurant["rating"],
                );
              },
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
