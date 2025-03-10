import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../../screens/user_details_screen.dart';
import '../../widgets/custom_error_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            print("Event received: initial state");
            context.read<UserBloc>().add(const GetUsersEvent(1));
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersListState) {
            return _buildUserList(context, state.users, state.hasReachedMax);
          } else if (state is UserError) {
            return CustomErrorWidget(errorMessage: state.message);
          } else {
            return const Center(child: Text('Unknown state'));
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
          child: Text(user.firstName[0]),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.email),
        trailing: const Icon(Icons.arrow_forward_ios),
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
