import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/auth/auth_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_state.dart';

import 'user_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.users.isNotEmpty) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    // Navigate to user details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserDetailsScreen(userId: user.id),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else {
            return const Center(child: Text('No users found'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_user');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetUsersEvent(0));
  }
}
