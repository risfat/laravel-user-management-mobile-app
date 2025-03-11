import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/user_model.dart';
import '../../bloc/user/user_bloc.dart';
import '../../bloc/user/user_event.dart';
import '../../bloc/user/user_state.dart';
import '../../widgets/custom_elevated_button.dart';

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
    _nameController = TextEditingController(text: widget.user.name);
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField(_nameController, 'Name', Icons.person),
                  _buildTextField(_emailController, 'Email', Icons.email),
                  _buildTextField(
                      _passwordController, 'Password (optional)', Icons.lock,
                      isPassword: true, required: false),
                  _buildTextField(_phoneController, 'Phone', Icons.phone),
                  _buildTextField(_addressController, 'Address', Icons.home),
                  _buildTextField(_cityController, 'City', Icons.location_city),
                  _buildTextField(_stateController, 'State', Icons.map),
                  _buildTextField(_countryController, 'Country', Icons.flag),
                  _buildTextField(
                      _zipCodeController, 'Zip Code', Icons.local_post_office),
                  _buildGenderDropdown(),
                  _buildDateOfBirthPicker(),
                  _buildTextField(_bioController, 'Bio', Icons.description,
                      maxLines: 3),
                  const SizedBox(height: 20),
                  _buildUpdateButton(),
                ].animate(interval: 50.ms).fadeIn(duration: 300.ms).slideX(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isPassword = false, int maxLines = 1, bool required = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        obscureText: isPassword,
        maxLines: maxLines,
        validator: (value) {

          if (value == null || value.isEmpty) {
            if (!required) {
              return null;
            }
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        items: ['male', 'female', 'other']
            .map((gender) =>
                DropdownMenuItem(value: gender, child: Text(gender)))
            .toList(),
        onChanged: (value) => setState(() => _gender = value),
      ),
    );
  }

  Widget _buildDateOfBirthPicker() {
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
          if (picked != null && picked != _dateOfBirth) {
            setState(() => _dateOfBirth = picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: Text(
            _dateOfBirth != null
                ? DateFormat('yyyy-MM-dd').format(_dateOfBirth!)
                : 'Not set',
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return BlocBuilder<UserBloc, UserState>(
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
    );
  }
}
