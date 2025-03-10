import 'package:flutter/material.dart';

import '../../../../data/models/user_model.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.firstName + '' + user.lastName),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            child: Text(user.firstName[0]),
          ),
        );
      },
    );
  }
}
