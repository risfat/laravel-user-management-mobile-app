import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../data/models/user_model.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart';
import '../bloc/user/user_state.dart';
import '../widgets/custom_elevated_button.dart';

class UpdateUserPage extends StatefulWidget {
  final UserModel user;

  const UpdateUserPage({Key? key, required this.user}) : super(key: key);

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _countryController;
  late TextEditingController _zipCodeController;
  late TextEditingController _bioController;
  late DateTime? _dateOfBirth;
  late String? _gender;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.user.fullName ?? widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _passwordController = TextEditingController();
    _phoneController = TextEditingController(text: widget.user.phone);
    _addressController = TextEditingController(text: widget.user.address);
    _cityController = TextEditingController(text: widget.user.city);
    _stateController = TextEditingController(text: widget.user.state);
    _countryController = TextEditingController(text: widget.user.country);
    _zipCodeController = TextEditingController(text: widget.user.zipCode);
    _bioController = TextEditingController(text: widget.user.bio);
    _dateOfBirth = widget.user.dateOfBirth != null
        ? DateTime.tryParse(widget.user.dateOfBirth!)
        : null;
    _gender = widget.user.gender;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _countryController.dispose();
    _zipCodeController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
      ),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state.successMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.successMessage!)),
            );
            Navigator.of(context).pop();
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  decoration:
                      const InputDecoration(labelText: 'Password (optional)'),
                  obscureText: true,
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(labelText: 'City'),
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: const InputDecoration(labelText: 'State'),
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                ),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: const InputDecoration(labelText: 'Zip Code'),
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(labelText: 'Gender'),
                  items: ['male', 'female', 'other']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),
                ListTile(
                  title: const Text('Date of Birth'),
                  subtitle: Text(_dateOfBirth != null
                      ? DateFormat('yyyy-MM-dd').format(_dateOfBirth!)
                      : 'Not set'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _dateOfBirth ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null && picked != _dateOfBirth) {
                      setState(() {
                        _dateOfBirth = picked;
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: _bioController,
                  decoration: const InputDecoration(labelText: 'Bio'),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserBloc>().add(
                                UpdateUserEvent(
                                  userId: widget.user.id,
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text.isNotEmpty
                                      ? _passwordController.text
                                      : null,
                                  phone: _phoneController.text,
                                  address: _addressController.text,
                                  city: _cityController.text,
                                  state: _stateController.text,
                                  country: _countryController.text,
                                  zipCode: _zipCodeController.text,
                                  dateOfBirth: _dateOfBirth,
                                  gender: _gender,
                                  bio: _bioController.text,
                                ),
                              );
                        }
                      },
                      isLoading: state.isLoading,
                      label: 'Update User',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
