import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/auth/auth_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/auth/auth_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_state.dart';

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
          if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersListState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/user_details',
                      arguments: user.id,
                    );
                  },
                );
              },
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
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
