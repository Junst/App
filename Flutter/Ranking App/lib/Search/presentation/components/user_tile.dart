import 'package:flutter/material.dart';
import 'package:myapp/Search/data/data_model.dart';
import 'package:myapp/Search/presentation/screens/user_details_page.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({required this.user});

  String userTitle() {
    String title = "";
    if (user.gender == "Male") {
      title = "Mr.";
    } else if (user.gender == "Female") {
      title = "Ms.";
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
              tag: user.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(user.image),
              ),
            ),
            title: Text('${userTitle()} ${user.firstName} ${user.lastName}'),
            subtitle: Text(user.job),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserDetailsPage(user: user)));
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
