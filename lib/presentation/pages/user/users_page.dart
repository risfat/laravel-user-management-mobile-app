import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:laravel_user_management_mobile_app/presentation/pages/user/update_user_screen.dart';
import 'package:laravel_user_management_mobile_app/presentation/pages/user/user_details_screen.dart';
import 'package:laravel_user_management_mobile_app/core/config/colors.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import 'add_user_screen.dart';

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
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddUserPage(),
            ),
          );
        },
      ),
      appBar: AppBar(
        title: const Text('Users'),
        elevation: 0,
        backgroundColor: ColorLight.primary,
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
          return _buildUserCard(context, users[index], index);
        },
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, UserModel user, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: ColorLight.primary,
          child: Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          user.email,
          style: TextStyle(color: Colors.grey[600]),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: ColorLight.primary),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UpdateUserPage(user: user),
              ),
            );
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetailsScreen(userId: user.id),
            ),
          );
        },
      ),
    ).animate().fadeIn(duration: 300.ms, delay: (50 * index).ms).slideX();
  }
}