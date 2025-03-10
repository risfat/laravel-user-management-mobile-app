import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_state.dart';

import '../../data/models/user_model.dart';

class UserFormScreen extends StatefulWidget {
  final UserModel? user;

  const UserFormScreen({Key? key, this.user}) : super(key: key);

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name ?? '');
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user == null ? 'Create User' : 'Edit User'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserOperationState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.of(context).pop();
          } else if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (widget.user == null &&
                        (value == null || value.isEmpty)) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text(widget.user == null ? 'Create' : 'Update'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (widget.user == null) {
        context.read<UserBloc>().add(
              CreateUserEvent(
                name: _nameController.text,
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
      } else {
        context.read<UserBloc>().add(
              UpdateUserEvent(
                userId: widget.user!.id,
                name: _nameController.text,
                email: _emailController.text,
                password: _passwordController.text.isNotEmpty
                    ? _passwordController.text
                    : null,
              ),
            );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
