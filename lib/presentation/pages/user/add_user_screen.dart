import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../../core/config/colors.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _bioController = TextEditingController();
  DateTime? _dateOfBirth;
  String? _gender;

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
        title: const Text('Add New User'),
        elevation: 0,
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
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'User Information',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(duration: 600.ms).slideX(),
                    const SizedBox(height: 20),
                    _buildTextField(_nameController, 'Name', Icons.person),
                    _buildTextField(_emailController, 'Email', Icons.email),
                    _buildTextField(_passwordController, 'Password', Icons.lock, isPassword: true),
                    _buildTextField(_phoneController, 'Phone', Icons.phone),
                    _buildTextField(_addressController, 'Address', Icons.home),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(_cityController, 'City', Icons.location_city)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField(_stateController, 'State', Icons.map)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _buildTextField(_countryController, 'Country', Icons.flag)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTextField(_zipCodeController, 'Zip Code', Icons.pin_drop)),
                      ],
                    ),
                    _buildGenderDropdown(),
                    _buildDateOfBirthPicker(context),
                    _buildTextField(_bioController, 'Bio', Icons.description, maxLines: 3),
                    const SizedBox(height: 20),
                    BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        return CustomElevatedButton(
                          onTap: _submitForm,
                          isLoading: state.isLoading,
                          label: 'Add User',
                        );
                      },
                    ),
                  ],
                ).animate().fadeIn(duration: 600.ms).slideY(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool isPassword = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        obscureText: isPassword,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: DropdownButtonFormField<String>(
        value: _gender,
        decoration: InputDecoration(
          labelText: 'Gender',
          prefixIcon: const Icon(Icons.person_outline),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
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
    );
  }

  Widget _buildDateOfBirthPicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _dateOfBirth ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          if (picked != null) {
            setState(() {
              _dateOfBirth = picked;
            });
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            _dateOfBirth != null
                ? DateFormat('yyyy-MM-dd').format(_dateOfBirth!)
                : 'Select Date',
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.read<UserBloc>().add(
        CreateUserEvent(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
          address: _addressController.text,
          city: _cityController.text,
          state: _stateController.text,
          country: _countryController.text,
          zipCode: _zipCodeController.text,
          dateOfBirth: _dateOfBirth ?? DateTime.now(),
          gender: _gender ?? 'other',
          bio: _bioController.text,
        ),
      );
    }
  }
}