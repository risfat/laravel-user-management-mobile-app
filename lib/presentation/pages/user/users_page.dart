import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/screens/add_user_screen.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../../screens/update_user_screen.dart';
import '../../screens/user_details_screen.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(const GetUsersEvent(1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddUserPage(),
          ),
        );
      }),
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else if (state.users.isNotEmpty) {
            return _buildUserList(context, state.users, state.hasReachedMax);
          } else {
            return const Center(child: Text('No Users Available'));
          }
        },
      ),
    );
  }

  Widget _buildUserList(
      BuildContext context, List<UserModel> users, bool hasReachedMax) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo is ScrollEndNotification &&
            scrollInfo.metrics.extentAfter == 0 &&
            !hasReachedMax) {
          context.read<UserBloc>().add(LoadMoreUsersEvent());
        }
        return false;
      },
      child: ListView.builder(
        itemCount: users.length + (hasReachedMax ? 0 : 1),
        itemBuilder: (BuildContext context, int index) {
          if (index >= users.length) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildUserCard(context, users[index]);
        },
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, UserModel user) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(user.name[0]),
        ),
        title: Text((user.firstName != null && user.lastName != null) ? ' ${user.firstName} ${user.lastName}' : user.name),
        subtitle: Text(user.email),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UpdateUserPage(user: user),
              ),
            );
          },
        ),
        onTap: () {
          // Navigate to user details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(userId: user.id),
            ),
          );
        },
      ),
    );
  }
}
